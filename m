Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5419592ejb;
        Tue, 7 Feb 2023 06:34:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9YAYqsOeU1rHtrDFKGmUGwYFJQdTXsUq2wDocBgpJvvoBu/1kWdeA0rjpwxpG+Y2lYZOb+
X-Received: by 2002:ac8:59c1:0:b0:3b9:b6e3:c78e with SMTP id f1-20020ac859c1000000b003b9b6e3c78emr6183582qtf.8.1675780488046;
        Tue, 07 Feb 2023 06:34:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675780488; cv=none;
        d=google.com; s=arc-20160816;
        b=Ds+pztoAUfOC5dZC6xAwRTNFERJXKpQKxTRVR6OPnUbNtHEF9VaPcUFXLCmu1yrzWc
         IkB8x7X5dlSpGyvtNZDMRipUlbQEEqUHEIsWWt2+VhmDS/Riq4WkSdnbHNfo0XCQ021q
         KNSE32S/VmIleLqEGcJSKz+L0ao8Z1O3YRe6Y3ZbaFIdvnMSyy+dFpx+AMaDucK0zidy
         17h4Z4Gs682bGuyLc+cZpWjQ153y9TiXvcz4CGBizQAdkczylNyOIri8ODKPFBsiSxVP
         1kJBaSVL5N8jtttCD/Pi01ElgYDl0yk5IB1krP4s3+IyCNHG4c2kAYTZRAXngQeDCgPL
         h58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fgyO/Nbv99Si2C5XaM4U2ruXGJqXvpH0ymdkNd7I7U8=;
        b=NsrzhlSNSIPr3/DqmxSRpmvpWfOtX72ycOsqZDyDROv2NWKBFI3xBgQS+rWEJT+ifq
         fr2k5le78R83YcC0PxBQxXCP2RnqP9ocZhHHO9NFsxeOlR+wQZotN/W7OlKjzysMHuwq
         hKrhNJfbos45avNrmAX5JU48B9HfnPNMf2cnRuPBVYMsNrwZgGU7woR3/7X3QzYOIPUg
         uxha/PBsvkiewBZ9YK0hIFtOTfSuzhUCli/W3CwIWom0pfxv04gdTjGfFNWMtCdypv4/
         kOWAlDI+MQ/BAwJtbifMIppbcmMgCMIXAf7RGfJYy3D7dVK3DuJUaXvU+hxHJ0RmdhMr
         +LkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IEpe4Pkv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020a05622a044600b003b63cc0efabsi10759920qtx.510.2023.02.07.06.34.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 06:34:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IEpe4Pkv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPP3K-0003oy-16; Tue, 07 Feb 2023 09:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPP3I-0003of-4U
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 09:34:32 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPP3G-00088b-KH
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 09:34:31 -0500
Received: by mail-pl1-x62a.google.com with SMTP id h15so8441687plk.12
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 06:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fgyO/Nbv99Si2C5XaM4U2ruXGJqXvpH0ymdkNd7I7U8=;
 b=IEpe4PkvGPMNhxZfZcTN/dAl/O987zrMDthYY9oyI0/nuSvTrCzIQZmvCYohunAxL1
 eBPJWsywxMLCgHCi9Qub+00WwINzBxweFxafaFVVmqn7eOhmRyVrkIV3Le3A8VRwAoQ7
 x5Iakx0XGohEhY1x7y6kOIotn70hl3JfMmfRagfIyP1qHRGPWOL3hg0jDQw575nPW17C
 iFrEB4HFtJTS0mWLgUOUE5kA+6m81Yi9uTS45+RogW08Oj/+QjpXOAZc2Rx4oDZKnab4
 dpHESSMEasTufxfqz0TEFsl0jXZoq4eIzYdxkX14IxP3aOBciz42njrUqE2xkQZ3xWji
 7bLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fgyO/Nbv99Si2C5XaM4U2ruXGJqXvpH0ymdkNd7I7U8=;
 b=nDay2KbimcthL10A60DDHbdHcWUfGjFaE16LKStRNaehJUK9QRAep9hgc/VIeQlSY2
 erW5V8+ZbTUWL0Ih4Nvs7T/M4Li1rOTGaA0yL8r6ihlBUw7BMA8dSxKqWBPacSme2+gr
 u9sys+/jLLe2eV8URYwlvv3tjDm1iL4n/m1gu/CmQa+mzaEIAXDI4YUMSvmaOQcXNZId
 t7coWo6A0kf66HpGxVvzJXDKO3EEXrUnjCODTIIBHg/B54qF8FY2G4M4Q2wHGa0ONNGB
 W5lnpIaWwe6hlP5dUOTQbuMF+lkqSFtZmQckLGawo1iM81+Mdf2HQzLZ7sJzPlPsHM25
 gyTw==
X-Gm-Message-State: AO0yUKUHBZM1pu1zhvTilUVtqO6yKN4vAcBYoQso3RhI5uGwppV5w/2k
 bpnneIoftkriD95+iQ3r7KbjmqEdp2v6NkrLMJLA2g==
X-Received: by 2002:a17:90a:a38d:b0:230:81fc:db1b with SMTP id
 x13-20020a17090aa38d00b0023081fcdb1bmr2888914pjp.89.1675780469178; Tue, 07
 Feb 2023 06:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-5-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:34:18 +0000
Message-ID: <CAFEAcA_6dwB9ygO-kr9vaGTH=wNavZoQpunxWQ4Nt715Y49NGg@mail.gmail.com>
Subject: Re: [PATCH 04/22] target/arm: Update SCR and HCR for RME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xDmsy/a74/vf

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Define the missing SCR and HCR bits, allow SCR_NSE and {SCR,HCR}_GPF
> to be set, and invalidate TLBs when NSE changes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
