Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3259956eje;
        Thu, 13 Jul 2023 04:39:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH2R39H+l/ibWg1ecg3IlrCvtYgp1Duy+MT1m3QXWq1hf3ByEzLM/Es7ZwKqj9BTbI/6MrN
X-Received: by 2002:a05:620a:4308:b0:767:671b:250f with SMTP id u8-20020a05620a430800b00767671b250fmr1304582qko.52.1689248388813;
        Thu, 13 Jul 2023 04:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689248388; cv=none;
        d=google.com; s=arc-20160816;
        b=Paxf6kv1JrF0EAeEaaSu5NQ77kMrihpu2YRbbCUWv2B444ZvgD4LhoYZbR9+7NE1PZ
         Fmqeqmlv5rdvIcTYLDhRUTTHemg6X+FMgz2GXWs4EIxbj200cuBz0EujCB4OsnFj/QK8
         kKJOsBDCBVcPcGZb9jUpv7W+dP4sst0653rbW8vdCQFdY05caERp1CVzDU69Ni674zj0
         THACG9D2hMNK/6+hsL8XaRtFpumHBECxUgct7YI1zMUG6/odsP8h9Jd6JVKNibkCrddw
         lhHo2zjxukKbiNcUJlDtrDYtqUkVeIfA7qzPf3HranpBbcvlRo9w86MFHiuFFbhWW6wd
         Rn2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bHuTsab/o2e0GzLe6p+rgYVT0c4HeA2lxQd7Sqvhyqc=;
        fh=JY/n1blFe7W2WfeCfBkL/4Ua7TCpaxW5eotazm4kk+I=;
        b=lp83N8Ow0bRcqmQF4Ie41qaK6X/cyjOL10Bl+Y+o6B5g3cuOXKBceRC5hYPbQq2n1I
         6pTZiaUJwnujUoOGKzonHx9Zg8jiCuQB9/FcneJncwCmB/h8i3pGy7JY12iwk1cd2p1j
         4AVcljYi2jeKdWDuz7QqQsy3VzDXnvX5z9ytc1EnH4vBqT6H01YrhJo/gYKjl8KI5nWR
         fcGCgv4tjvsOgEDqLSdav7NpwfMfA8pqIPvRvSyvcoZEbpO2t9Vauv+XxlIUNK6F2HKM
         iQGcG5nKGW/Ctsxn5PZeaE7S8IVGNzuUY+pPMgPf2CpWxy1NNZc+JYv2M7RKI3cjXRu3
         P+NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lHbTDPUA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay10-20020a05620a178a00b00767e7fb7bdbsi2245854qkb.171.2023.07.13.04.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 04:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lHbTDPUA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJufU-0001zU-Nd; Thu, 13 Jul 2023 07:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qJufL-0001xO-V0
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 07:39:24 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qJufJ-0005Lq-PW
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 07:39:23 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b7430a07b7so8864501fa.1
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 04:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689248357; x=1691840357;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bHuTsab/o2e0GzLe6p+rgYVT0c4HeA2lxQd7Sqvhyqc=;
 b=lHbTDPUAnZjTWDyEc3je1GJ3j+JMvuHnDo5zKwuIi/mRJCjnn5JMIYU7IBNG9hiPuT
 2ZNyaQQ8kZKU8H0Kqs1K9lNCPg5aXuPhXJJJ9B7SFxgqbQkkSyOrvp64/6H0FYJjaB5/
 uqGzkI8k1kEs8/MZDZKeexyaM8/OAECxR4jugjkGBGEu0lUZzSimEQcWPjqhB0EyUbQq
 sDHEChsbIPc9/GAYR9+nwe88KFz7asjactLLN2XoKCWvfL0SePW0Aj7Y5U8u4ogT/SVw
 Vt9vAzXQp4Lmc40W+zwG6/3vAB7swOrQyT7mUGSGl4xSqTWBcHRB4JLeKOE9QxyAV89h
 cprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689248357; x=1691840357;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bHuTsab/o2e0GzLe6p+rgYVT0c4HeA2lxQd7Sqvhyqc=;
 b=Fdi2hbdmFF6B57nR++MPXvWMaAEp+qZH4KZ84Yuw0L4DefnURn0w5+xkXL68MaqKvk
 POaB+oqpdP6srdmw0w40HeVSF0ZQKs64i5LmoaNO/fhNgaGZb1d5xXzIIRNTTEqdg2IY
 BqXNwOGQsWfzJ7l+9a9isXqu5U+Sc+ERNB6TBfQdrg1ThaTGf0buqjkG3sSpd/jwbC18
 0+jutUZfnXTURUHxwDZylFQrUZWbkbASZYrXQUX5jP6BnVV1EA7vQ+Qovj/0nRTmRPr7
 OSPzAxnocWJzJpmgEv7N+NHU10W4D2F1WnZAPQEXa4Kc1ZqO6b57g1GaAZpgrK/mkn1J
 8ZMg==
X-Gm-Message-State: ABy/qLbpIVI0qMgoo9XhGAzP/8Ave4v/VE+Wa4BZlIC2TpKpIw11K3sN
 +yNFi2hJkTOUx1UNf84wgdEdXD7JEc7ar27a+Ve78g==
X-Received: by 2002:a05:6512:1327:b0:4f8:5600:9e5e with SMTP id
 x39-20020a056512132700b004f856009e5emr1108853lfu.47.1689248357547; Thu, 13
 Jul 2023 04:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230710063750.473510-1-wangyuquan1236@phytium.com.cn>
In-Reply-To: <20230710063750.473510-1-wangyuquan1236@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jul 2023 12:39:06 +0100
Message-ID: <CAFEAcA_1oRpRKzTYeboxVzkiVErZAgFQRw9sVunXnWUMSf_SOw@mail.gmail.com>
Subject: Re: [PATCH 0/1] hw/arm/sbsa-ref: set 'slots' property of xhci
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: rad@semihalf.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, 
 chenbaozi@phytium.com.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
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
X-TUID: udxWLlRqsb1X

On Mon, 10 Jul 2023 at 07:38, Yuquan Wang <wangyuquan1236@phytium.com.cn> wrote:
>
> As the default xhci_sysbus just supports only one usb slot, it can not
> meet the working requirement of this bord. Therefore, we extend the
> slots of xhci to 64.
>
> Yuquan Wang (1):
>   hw/arm/sbsa-ref: set 'slots' property of xhci
>
>  hw/arm/sbsa-ref.c | 1 +
>  1 file changed, 1 insertion(+)



Applied to target-arm.next, thanks.

-- PMM
