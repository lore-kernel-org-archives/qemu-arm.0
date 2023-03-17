Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp878505ejb;
        Fri, 17 Mar 2023 06:46:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set+I/O+hHObsW3PUF2vREBBnf/bXkcjU4vQQ0DDLIqtlMUINbVH7UT0i3bgG0wJuTryiBBgK
X-Received: by 2002:ac2:5de4:0:b0:4e8:49c7:9956 with SMTP id z4-20020ac25de4000000b004e849c79956mr4594843lfq.51.1679060818083;
        Fri, 17 Mar 2023 06:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679060818; cv=none;
        d=google.com; s=arc-20160816;
        b=ew7c5FYEw/b4npcIO6NHZ+JXjGLdvLh3qztquZT5x54sNhIDN8JqM6oZU59Ah8vNFx
         967/9gJp4MNeiUmCgK8O2KBbkW+T4cMLK6WngnWhQmjC2Y/yVgHalHWCyYd818sJPRjl
         DopmdWQ78tatOgdGYphrQd2DbMfOvV8Y9wo0dKjR72Sx6t1hDvgQXJp3zoabcC5UAWEe
         +9Pwmgh0SI1G8Fx8uv1MAWOfUKY8Cz+Gq4ycmf+9Obl7HCCXJT2Lpael6AIoLv13E43K
         gKyV+LObe5nxfMUg1bCoDnf8Aj5oK1RG1Ah9va++P5v0qF96tCj+NU/B+pHoTl3cX1sc
         TyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aI5/+qbhXbb9yXfNr6krILKSD+1O4FNP+tPqZ99lLPc=;
        b=G37Yst+AwvNIWdtHKz9QgHcjK9dOqSA4MT+yAu6nRW+ImxM2fwkVf3Mthr8tP5K5yx
         m9uRTKi2yZHq5a2+TCah9Cx8bJctCzrxg0QJYmtBfISlSgILhWWe14k1X5bQh8BhvXTl
         S0dKM1JzJD9R4JeQjJZiQP776pX3M8/lywD+zBzht/bXYHV+gCrIxqznZS7jnmxV46kk
         pXSXjqHZ5pcseNpirqWuEC590khr7xtoBysqjVEXkRrsBHS1rWK0sRlX/EgUW3UnJYM2
         1/4EO50rV0cmbXR/FcifeG7rr/Rj0jYWZxcOWryH8QGWxxeSISiqmpZCBJBW0w5NjzXU
         194w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a84BR6tN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a056512049100b004d850003122si1118514lfq.50.2023.03.17.06.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Mar 2023 06:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a84BR6tN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pdAPx-00069C-T4; Fri, 17 Mar 2023 09:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdAPw-00068I-Ap
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 09:46:48 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdAPu-0004cs-LM
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 09:46:48 -0400
Received: by mail-pl1-x62f.google.com with SMTP id h8so5321849plf.10
 for <qemu-arm@nongnu.org>; Fri, 17 Mar 2023 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679060805;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aI5/+qbhXbb9yXfNr6krILKSD+1O4FNP+tPqZ99lLPc=;
 b=a84BR6tNGq/qAjsfekCdyNBec5bPstuYRnQlJCBURRUjIQ+9CCQp3zHgG9tDTt+3w8
 eRGepkEv7q8N1XOEMlFIhvQ25xEGwcTC1gweT8GUffWD5OUO1rQt9zjvGt4SgEkpK8NG
 v5P05W/rVL9zTXkJkGyWRsgH7JohrhAKg7a77tgMNZGapJrObCul/pNL25AcoaYV52kA
 PEq7NKRRfYF8+BxvVgfWiplNZsJTtYLeBLUTPvYSjMk7UueGd4AolafRx1EoiATH8TTx
 0jESGf6uvQEWUpW5G1OUPh8+299840fG4DYWueASHJgEV5a3/Vi6XV1LLf3kZLfEo5oJ
 Hz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679060805;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aI5/+qbhXbb9yXfNr6krILKSD+1O4FNP+tPqZ99lLPc=;
 b=Ow9sM+Pl7bUtHZNZvuzKlGJ4zRL9UnCGjSK9RJ9M8308YYgGFWVGNOKIP/19vXWD3g
 NWks62Oi0HqatrnIm+62HQG9Mn97udP5o6HICJlxEgDcAxCUxQvw9PU0DPrKH1n0y7zT
 teDcRgRIcn12Gc6Z24yEy+OAMYY1yHizGsKyIjehpbPqgWkz3IsZNEvnBdcN54ucjQ1/
 13l+FSxsUiWyX6hDuh7Yp63MnxUnHj7arakDebPjNPddLC7OSEzJ7Qln2vEHnC636+nY
 wBeZqOk7TvEEDkdunwWq5JkkEDJtUDLsrxAh0j/pfPbu4gVYcvBes0Dr3fvCt573kMun
 ianw==
X-Gm-Message-State: AO0yUKUipiCEO+zkfrAFHHdGEDhAn1L5RtB2P0uudPMEoD1OjS9vsM6x
 huJe5XgZXQgD6KQXGkAhI6qP5mEbTLRWUV+bKEUchA==
X-Received: by 2002:a17:90b:3747:b0:23d:2de7:717d with SMTP id
 ne7-20020a17090b374700b0023d2de7717dmr2378550pjb.0.1679060804891; Fri, 17 Mar
 2023 06:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230316234926.208874-1-linux@roeck-us.net>
In-Reply-To: <20230316234926.208874-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 13:46:33 +0000
Message-ID: <CAFEAcA_jcAaSdfF1CK=EW1XgzuFBiVvK8t1dGjobRahQWkw64w@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/imx: Fix out of bounds access in imx_usbphy_read()
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Qiang Liu <cyruscyliu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: dblGQ+N4O5c/

On Thu, 16 Mar 2023 at 23:49, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The i.MX USB Phy driver does not check register ranges, resulting in out of
> bounds accesses if an attempt is made to access non-existing PHY registers.
> Add range check and conditionally report bad accesses to fix the problem.
>
> While at it, also conditionally log attempted writes to non-existing or
> read-only registers.
>
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Link: https://gitlab.com/qemu-project/qemu/-/issues/1408
> Fixes: 0701a5efa015 ("hw/usb: Add basic i.MX USB Phy support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>



Applied to target-arm.next, thanks.

-- PMM
