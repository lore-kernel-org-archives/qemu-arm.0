Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1215502njg;
        Wed, 26 Feb 2025 14:27:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVv1hCBNG8or1Mc8tVE9wKmtImt0/f50zTJkKtWEOL98OSwX7CdYexfN9J8q2ihfQ2+7rpvWnKCnNJfg==@linaro.org
X-Google-Smtp-Source: AGHT+IF583D13AU/qpMymy4S4hsHm8dzPXbZxmClojZUsoaYWJ+J4hItwLKf1vDsBkMNF8HFEfzU
X-Received: by 2002:a05:620a:25c9:b0:7c2:4b6c:3c1b with SMTP id af79cd13be357-7c24b6c4704mr442388685a.24.1740608822112;
        Wed, 26 Feb 2025 14:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740608822; cv=none;
        d=google.com; s=arc-20240605;
        b=K854tO4X5PTtSLMtcurqZccmiy69BWLxsiErSrDblkk4Uq3gnIrSYK7x6TkTluEr88
         O6mZ4LiiHCRYRpaCZXATZOpRoxp6mZp48QsZgCxY9I7tyW57nUcvj4oHml/LLOS9OcdX
         4013dmIeP5aJ74N5MwzHHnHFWuF7DUUaeU7grAhJMTNrkkRJfk5ARZtDLk8dYosBrs+w
         Vb4CalAMRfmceeJQdKQz/pXkeJh44H4WvlDsXXFiz414VaTKXmubRcD49ETZLI2e7Wpo
         XFEVSasWItpLoYZta4N77wHcTqixB7oMDwYBEyZkEsRI965ItwQfyO7VfcG4BCsjz9NK
         Qepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=onGhEuhiFf7mZ5I/v/m30+rNq+Jtn6AKzRpbfgvQL2s=;
        fh=yQKIrDtZlsW5mptFNUMQ44ntGtpGUZwwakSHSM87JwY=;
        b=IC5xSjdQ8X+/6Ywhh99BuHL/b9Bm/rmZR11NazPaLviLrNuHq1aK/ptaq44etaCcLX
         eISv0RJ9qTxmlJU65bIsJGwj+2xXL1jCmc9K0T6lT5BkhdjDCq/dspeKSPP3jWmID6zY
         1ec7jP9dvHCcNeqa+cODulF2aJdv5hRSB1dK53yXhnhlDNuR2DhyBVaoevrfBPdOJceH
         Wdq/tHymNRIHYj3WNI8EX8uuwcMCpnyRUiYAkiI00MWyp2OBU5GRv2cWWrWRhF893TG9
         5MFw1Qi0mEIFjaPem54AlZagOQVBi7kvBQ3si1FGdIXJN75oDXOH0XgT11BcfnHCfsHg
         d1xA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RVLuhAzE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378db4824si15743585a.631.2025.02.26.14.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 14:27:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RVLuhAzE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tnPrW-0005tG-Qx; Wed, 26 Feb 2025 17:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnPrV-0005sf-2E
 for qemu-devel@nongnu.org; Wed, 26 Feb 2025 17:26:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnPrT-0006i3-AH
 for qemu-devel@nongnu.org; Wed, 26 Feb 2025 17:26:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43948021a45so2864045e9.1
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2025 14:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740608797; x=1741213597; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=onGhEuhiFf7mZ5I/v/m30+rNq+Jtn6AKzRpbfgvQL2s=;
 b=RVLuhAzEXd6ohxS54BEnFATfSn+EAyN7FA+3/j7V5F2Fa439mgoOpM6MdGzyVoCDwv
 M9YtzPp0ZLEV8hLDQVxaImDbyFHc5xSaKKv3WAqGQLDRGGGxVt7g76ctMz4cg2tOAFb4
 3guPmGUZbHk8OFRRn4YJ4C08dsbtUouukvErTBJ4BQKZP9b8kLgoyuzE0SdHpSpl1fyu
 Hrqb3DrduLRIaqPsWutGhIa/8IDEhDD1IzrCxPeLTq1wUXrQrEKrL6NxdyeMdYJcTrR3
 CAJpo57hp+OCHSs83CFvOzsQoLUAi62Tzw+DJQE9107MYZexZG0F0Z0M98j5U1iFvrzm
 /fHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740608797; x=1741213597;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=onGhEuhiFf7mZ5I/v/m30+rNq+Jtn6AKzRpbfgvQL2s=;
 b=P22Q/GlOE7uQ32wacD+sPa0gM0Kag0CtwFgLi0Q1NXEp+/ByDS5Xb7G6r0TN3BTlbx
 RSRhjnqDYBSBP1rlfvCznI84+55xnBxGifDpO1GN6taoQS8zp+JHSPgvvF2JQUBtaRUI
 mEa6/r7jS0VfXLC41OPI0udjjB++iiCQvtivKqD5fi4AMaiRbTGTxHZCjqhdI32KZb1u
 TrAxceFzBBaYnHR6NAH9fRNxvJaO4Pwy/653aO0CT7jwq2+sk63MX4a6joZwdLCZV2SL
 1yhA4zsVib/Q6r84yPBiS1Fwvy+32nz/eFue762BahuaFb9o3m4qKxqgwRRudcWL1pzx
 llVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvEF4h57XKrtQtOZJum89pX4AMfKi7PvH13gaUW3RUzf2OUD3T0c4BS5eNBuLeBc/f+Yu/GeQRnnR+@nongnu.org
X-Gm-Message-State: AOJu0YzDhMH3IhIM0qJy7l3oNvyMTh8HeXc1YRSfkwdyrmXAfKKczR9d
 hBCDo1vhZonCDVUq93DOOpNpXk786d/fGjAZdX7gANlwA0Egvl4+OpI09g9pJ1U=
X-Gm-Gg: ASbGnctTdAHXadZG1LAckAvj5uzJS46ISJO5v1HodI2jPMrfXA1KFcd2tbWoN/taHte
 w8QM+TE03DGeDYemvo9tbkxMq4rVVY+quuGnqeQRP3t3b9vcT3dX5TO2UcJxlEMKzP5b52BN3Jv
 MPajrKD/FsZLXOzVgGCiUgRCupArhZOEDyiykOhE1YDUEmIMw3bAea+m32P3xpC92koE5xIyDfq
 uUPhO1LQGwNRn66YA+W2b50Nf6WdHmIGfSGubNsRAyihx+TEJ5wgUVVR+cPxdl2rMB4BJCqDqB+
 bp2bwVcbX3XQ6NLLBVnVkH9nf31qE78NTvNjGTvNQ4uRYrgKfidaUl9rSOMHwLzCsHBpWQ==
X-Received: by 2002:a05:600c:a08:b0:439:60ef:ce94 with SMTP id
 5b1f17b1804b1-43ab901d6f3mr37087175e9.21.1740608797405; 
 Wed, 26 Feb 2025 14:26:37 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba52b947sm35227965e9.2.2025.02.26.14.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 14:26:36 -0800 (PST)
Message-ID: <3a2c6943-c49c-4ce1-be7f-c306a9309c00@linaro.org>
Date: Wed, 26 Feb 2025 23:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/test_arm_sx1: Check whether the serial
 console is working
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
References: <20250226104833.1176253-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250226104833.1176253-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yIHuM8cZUxdz

On 26/2/25 11:48, Thomas Huth wrote:
> The kernel that is used in the sx1 test prints the usual Linux log
> onto the serial console, but this test currently ignores it. To
> make sure that the serial device is working properly, let's check
> for some strings in the output here.
> 
> While we're at it, also add the test to the corresponding section
> in the MAINTAINERS file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Based-on: <20250221140640.786341-1-peter.maydell@linaro.org>
> 
>   MAINTAINERS                      | 1 +
>   tests/functional/test_arm_sx1.py | 7 ++++---
>   2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

