Received: by 2002:a0c:e144:0:0:0:0:0 with SMTP id c4csp1492897qvl;
        Fri, 3 Jul 2020 06:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBH0dYMXXU4eNUHlXCqH4ql9FBatRO2QJ8VnoT154rUhQf874t+IHacSzOhpUVuTBqW5Fz
X-Received: by 2002:a25:c483:: with SMTP id u125mr54144088ybf.298.1593781396070;
        Fri, 03 Jul 2020 06:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593781396; cv=none;
        d=google.com; s=arc-20160816;
        b=0BSAxIG8AvD7W4v7n2p2gAOeqvIoKfzNmcBi1nS77tDlWV101ViS8rj65vz+XF1a6y
         7wWSxwnnQSlFh1OUoP8ornuw1muTOnoel5wEBpeLgv/OVvVkyICuLW8RxnSHiwVK/L9K
         EspkmcyePKhXpJuY1TqjS6nJ+28GMyWr6DV8UgPae/cQkIgHXUNy6+4n7UcF2srMqZLU
         qB1tYgLFffdil8OrYKAdMi3Vy2aQsMHlGwZiYugsCdMI+O9UyCvuemRuZHm8HaFEnzaR
         LEmVzX9ANtxqBxd8RgPZ3qiKY02iZXDgUvqrOe98i4WL973SU/6z7PebWgUC5tvSdZXx
         3pKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rBgxuHCHS3fxFE2hat1Uonsm9BPtmcuF+c+sPALMllA=;
        b=t1m6SqYeL9MLsY26XaQUgmQqRZkb5/W1meIxbWk/Rniwy2sSoxmPPrJlLs+3vd6jgm
         OfJDzVcBmN5x79JPsWQXC5kHG9E6VY5S6MAlJhe1KiFsbkKFjCHsB2hrdYtH5NbDBc40
         sL3p7exg9KsXoMI0bsU7/0fJfhb/7NNIlIsXhcMqvQJrvs4mangHy6vn7iC4G5kT8s6O
         aXMkqIslAPhfisgZmoKng1cs9vFiF8QnETS+Jp46u7VH0ov13q039Ft/yYgzeF6eJaof
         Zu5c/CMFINGMpLwT5FSnm7NCxZYjnME2Eai41t9XfJ610O9eYjY7AXoeb9qn1DM1RqOd
         WjAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RyQw7N4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si12030052ybh.9.2020.07.03.06.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 06:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RyQw7N4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrLLX-0004aQ-50
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 09:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrLLI-0004Yv-9q
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 09:03:00 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrLLG-0004k2-Sj
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 09:03:00 -0400
Received: by mail-oi1-x243.google.com with SMTP id t198so13893919oie.7
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rBgxuHCHS3fxFE2hat1Uonsm9BPtmcuF+c+sPALMllA=;
 b=RyQw7N4VBpCwlzM+lf5RRrWmIrNQRDdCs2QMXh8d/dGePq4NtK3pB8hHFvbEnqS/6T
 wCbcPIyZQy0PG66XLsZjEVY4bMX/qg/hsVotnXH6Nz0+mRS2rZmmPAPY6CIMgx0wY/2j
 8BHmQ56/uJRm3MvLJ+5waBqXPmrzf6ehHZIwpyS+5/6wI8ABJgbPRaSpNQrSofWsucvZ
 ROT82T0UKIpdd6cXcQ88NiJ5ZsTmlutIjt+W0BESN4yiE+uqhuW5Amr5tn7m2KihitEn
 d9+y+Ga09KAZ8ubQmP/BQNGADergUPsA3kxso9/4m+4GdoWcKq1tzKRqvBCUv478WL/G
 2+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rBgxuHCHS3fxFE2hat1Uonsm9BPtmcuF+c+sPALMllA=;
 b=hJH2XxumRIsA7/sPQVY28bE3a+/kKoAuQBXgpzzdil0RMurj1zsSOtToqQERXspdSi
 TH1KYmCVEMcnfyi0vM1OYpyFQvSsDtSXNj7n4QDuCP9HJ5maavETCgcKmM5vhPhbPi1I
 9HdRFjC0brgn6iAsuvShBUr5HHInZaQLcdIxMFo1qpw1kOL2Msi2N4IMX9gL2+9MjjIS
 Iw7LC8BuclQ8G1S6LonMxQDQnwHXwlQBiKEe5jcfYgFhZkOkYlvvNEq3ao2IstjN7/nM
 8BRuB0cuXso2dHu3cofXu6gcdtIBtrw4wspgpAyWS9gDPzNvYvzZQ6+FzrWkUzL5zjjL
 OnYA==
X-Gm-Message-State: AOAM532iRbY3D16rsXpqBD740kLx0CRt4sGEge/WQqU9rxocPlcWXAQe
 iiBi1HQ1f6qhFY4xa3mb5aIBILTcykK6gBU4AzKBtA==
X-Received: by 2002:aca:2819:: with SMTP id 25mr21027392oix.48.1593781377711; 
 Fri, 03 Jul 2020 06:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200629140938.17566-1-drjones@redhat.com>
In-Reply-To: <20200629140938.17566-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:02:46 +0100
Message-ID: <CAFEAcA_zb6DxEV6voPVSPy0ZrtSF6Wr=atkH_r-GuHa-fF2CGg@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 ard.biesheuvel@arm.com, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WO6ICGBt1kHe

On Mon, 29 Jun 2020 at 15:09, Andrew Jones <drjones@redhat.com> wrote:
>
> The flash device is exclusively for the host-controlled firmware, so
> we should not expose it to the OS. Exposing it risks the OS messing
> with it, which could break firmware runtime services and surprise the
> OS when all its changes disappear after reboot.
>
> This change was suggested by Ard and Laszlo.



Applied to target-arm.next, thanks.

-- PMM
