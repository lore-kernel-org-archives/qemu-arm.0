Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp68038ejn;
        Fri, 23 Jun 2023 03:28:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7uYAIQg6uhhOg/XW0jcDO78qg0dvG4hMcQMuXQOtaYz1IVo+XZ7LCWiflySeWvJm+T+ZNp
X-Received: by 2002:a05:622a:1702:b0:3f6:b0dc:1084 with SMTP id h2-20020a05622a170200b003f6b0dc1084mr28096111qtk.54.1687516080092;
        Fri, 23 Jun 2023 03:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687516080; cv=none;
        d=google.com; s=arc-20160816;
        b=NJkf0tR9Dvq4fDH8VY9M4H+QyG9azoNhZbciw5Nyhoray0dQRhEA/xePb9H+w0NBAV
         pLWobl6tTspGHpJHoiFKF+ZnYFxe9Z4dOytB6+xOUOOQ4rz9/ConTVip+QeUwoXGmwCE
         CNtrxYDdzALNfGFCvty3Qv8PWVt3TA359p9JLaLhULdSdH1DaZwAMeRh3kDzY/yi/gNv
         JmDoPSZPUUEhkjIsOTfIgtXVuu1V7IhKX1M464H0naUcIfV5O8E6rVyMPAA6qEKKE6BU
         wNZvAGFfWlxSoQhVGuhyfclBps2dc2XZh+b9Z+A2N0s6bupV+ZhbDqaKtpx6std//6zE
         iHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+uhIURa+W72BPO2EEf96ntY30qeTAcxropPwLHBkvmk=;
        b=psJ5cjbdp924h8FmAz3lrso4RWCDP8CFnsPlTBAyF0iGCa3/Cp98o3KG3Suj6Sa3au
         EKRN6nqTNMTCWtqlttgabDGDkKFcDzBuQ4cEYFJNjMrfo1TWpLOQjnPZkChp+1jENNSS
         85yJ+u91cTetbWyDSeqVYYwX+xBKEyoJu5rrJYHtbH6+qqFN1aPGi+rf4XHlKSELUj0p
         q99c8tBKLRm1DZ2G5+a9tqG2l9PmSO6vixp/lL5q6hO/AGd8PqJ2i0Th5cCDm0F4ewen
         CLY0BGxU6aAObu5gozY9dOoVYXVjN6YP7TRFOVbNVALxvFrBCsWZ9gdOYIusPluAxdc0
         FFYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V9oHB79H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020a05622a110900b003ff1fe3cd40si3469497qty.162.2023.06.23.03.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 03:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V9oHB79H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCe0t-0000DL-5s; Fri, 23 Jun 2023 06:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qCe0q-0000Ci-V2
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 06:27:33 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qCe0p-00018b-Cq
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 06:27:32 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f955def3a5so536262e87.0
 for <qemu-arm@nongnu.org>; Fri, 23 Jun 2023 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687516049; x=1690108049;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+uhIURa+W72BPO2EEf96ntY30qeTAcxropPwLHBkvmk=;
 b=V9oHB79HcaQ1KsE7neNNaQ0BixUh95zF2PHhJ+R6hk420ubXrKjPyTDORGLRhGxcmM
 ntC3MFT6wccp5pHediPpS11ZI0+XH80EXXWTcfAROc6h5HFmBdfnTWGZV2nlIf56P2L+
 q12Z+GWPMV62MREnsN3fKTUbpk1Yq3ZWoZBLCDrYJ1FY8v3QmYUwln+obcKYdb49miRq
 sKgemHOVRVi+9rHmrNrgBCs2TRJPBmV0W00eu8PLCNi47QhFzzcft3VpkdpZGUm93wnJ
 4upL8hiiDGz+DpCi1pLEyDnzIGkBg0YG7m5bFDadH+OXKa6DCfmbRq6MR+tSv6o44pu9
 7gTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687516049; x=1690108049;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+uhIURa+W72BPO2EEf96ntY30qeTAcxropPwLHBkvmk=;
 b=jGfLBONDVHbHdpksqaB9rYk/VNxP9+oZvHG+htVBhe+30U7ehWuWwfg6M0fc96SkDv
 37uoqRxn0fE+SEh6gcwUFj54DKFrIc1zAo+vy2XyBJUR1wpSvPp8ms05AWDNxCFoXDyd
 ot13MeFxCEXnIuieljTER8fnvhIqFJah2UETGfoLlRmgGfS/JVTepAVH+Sg/2o9AhHam
 hWc9ylR2aE/W1PCMlsw+5fXPFwy9Bw/CX3boLtlcoNH1vF2akt9btFHVH1FvdMG4Xz+O
 bFSb5Jjvb3fUhXreatID2RY8Da3E/ElH4GsXZqQ0v/qgih8hoXhawpKKFhTUazV/YOyO
 nuOA==
X-Gm-Message-State: AC+VfDxR2jaKHbhVPkyCkW+qsl7yJwTIQlTXyHh4VEsiGRHJasIpZwBh
 foPe1rFdn1+rE/pd5qvAzcsbn1gmBhnjKDEgimEPsg==
X-Received: by 2002:a05:6512:39c4:b0:4f9:5a0c:85b8 with SMTP id
 k4-20020a05651239c400b004f95a0c85b8mr5433051lfu.36.1687516049374; Fri, 23 Jun
 2023 03:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230619140216.402530-1-richard.henderson@linaro.org>
In-Reply-To: <20230619140216.402530-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jun 2023 11:27:18 +0100
Message-ID: <CAFEAcA8baKHuwE9Rhagv69aSQu22GPvhkUf0j9dFB_zrVqRmvw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Restructure has_vfp_d32 test
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: au6ONS4J5rqY

On Mon, 19 Jun 2023 at 15:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> One cannot test for feature aa32_simd_r32 without first
> testing if AArch32 mode is supported at all.  This leads to
>
> qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither
>
> for Apple M1 cpus.
>
> We already have a check for ARMv8-A never setting vfp-d32 true,
> so restructure the code so that AArch64 avoids the test entirely.
>
> Reported-by: Mads Ynddal <mads@ynddal.dk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to target-arm.next, thanks.

(We can change the check in the "provide 'neon' property" code
as a separate patch.)

-- PMM
