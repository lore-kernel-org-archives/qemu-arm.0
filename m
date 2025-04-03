Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4131942njd;
        Thu, 3 Apr 2025 07:05:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhbFfQcc0mVxLy6KiB/zw0qfcJ+2T7LT+NU8vFE6QADKc2IFbQrzXBlJwjLI3KrRYe83FKQ4hOe2VzLg==@linaro.org
X-Google-Smtp-Source: AGHT+IFsjnNqpLntYLh+75cvJR/u43R+Gtmg9MPJLLpYeXb+tvAwa1RpwTgtKS2d+LvLk0G0A+9v
X-Received: by 2002:a05:622a:411:b0:476:abd1:7101 with SMTP id d75a77b69052e-4791966d4bfmr39730731cf.46.1743689123552;
        Thu, 03 Apr 2025 07:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743689123; cv=none;
        d=google.com; s=arc-20240605;
        b=ajc1ElE1J6y5auO7QbXpm68FH72PcoHuj+Pa/pIxrG9jxDBbT4h/UuDkbz2jYPRrxJ
         mdN51jQd1x9GjWvrfs62iuftiLQPxHiJFNLo9T/bAZMCBtIA+R77YgOO1kD+IgELHRij
         wrUk56g9kghCTtd0K/Rs7tnoW8QFeFFZwW00hTeK6kwMlP8eXR61qDnTDDAZRKBpvbiF
         HDDAQvKcoP0cYw7GuPq6suBPkPBE3jt+vmtzEUsE++B7EiqIYUfvliWtfqbxMNmVQ/a+
         +qz/hRgDYSUFQNWEoGkP+sw4kj8u46Aklu81f3UVPdrxff15YGoEp7OGaNUhjPOwmPyp
         vycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=XLXdAS4trprj29nGaRI5aZfZ+sIl3J+uLzGKL5gCqOo=;
        fh=oEUcfB8wusdpEVdOVF6CvOk9zu2by1lsrQUQDTxYWEY=;
        b=QwQVVhDKwM/CILMEXji70zt5Snm7L75ksIePiBsBuHU6HdEu2q2i6V0jYnc3E/sJL7
         immxNEt4eWpW/lfCrkyAo13I9Wt9maxQs1DpsrfLvPGoW4ysnAy33vMG10vUimjOOTpq
         kukCB4CgLLx3R0bbByuMngKJ4LF4pE6sFzByPsMuEvYEliPHk9BmjnczH/qjNuRgRVfP
         6jhHBxx7nW+pynL3HplCN8tVqcd9FsHjr1BcxtK+Nc6HFf98rNn76v1DeZWV5J5LoYwm
         0YyAaWQGb0CKsGzUEWo9OmJ9Ay1o+02c5QF0odtCs6iLI6tZc0WCxZREJUahR79umh9Q
         rImA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OWhg5wBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4791b05c5e9si11710441cf.58.2025.04.03.07.05.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Apr 2025 07:05:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OWhg5wBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u0LBw-0001Ps-SC; Thu, 03 Apr 2025 10:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1u0LBu-0001OD-IQ
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 10:05:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1u0LBn-0001Lp-Pv
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 10:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743689101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLXdAS4trprj29nGaRI5aZfZ+sIl3J+uLzGKL5gCqOo=;
 b=OWhg5wBiHRWyjlkOKYXUMEkiJeS5lzbRAbIUCHVF4gnLIVfTgel16kkL6E9G0V+WwBFPCZ
 hb/XA/qOEWkEkyAMXU+VLdpRF46j+37fLb4npmhWUBM7knhqoCtrxz4FgMJOcILF2l3HYS
 w+xQfYQwGib+I3sBaPNo95Xi6yHGKr4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-6inmJRhSM1S5qx5HwDCs6Q-1; Thu, 03 Apr 2025 10:04:57 -0400
X-MC-Unique: 6inmJRhSM1S5qx5HwDCs6Q-1
X-Mimecast-MFC-AGG-ID: 6inmJRhSM1S5qx5HwDCs6Q_1743689096
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d733063cdso7731875e9.0
 for <qemu-arm@nongnu.org>; Thu, 03 Apr 2025 07:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743689096; x=1744293896;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XLXdAS4trprj29nGaRI5aZfZ+sIl3J+uLzGKL5gCqOo=;
 b=TETv9Td9AyJragT9HqE7QzOf+L5p3QZE+kvOe8Vq1ptZJli0F+0TsyD3vft/VUoaaS
 1zXkeYg25vZOk+7n9dSdGqo+AbE0Zne2MFTA9nDMIz9+IUL7t+ZDQhwwNzjsRR6LvN73
 2lWoTtyrDi4ACqPe6nT0Ry1ZRutAES8978CMmxrwJU/AUObLAsFXLo75gloVjaaf5i3d
 9bO6iKRC5cijSdU5YHYvgm3DpBN42vbs+N/fZPoNsz4VNGdDyGqFzqvYvlSiB3rYEcyE
 EX4jZmUaUwp4ykk9XkH1CaK6j/TBpaCLoe4z64ZziyRDUXeJg9MXU37soGdO2+lm7Y61
 jZUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9voxo7S/rA+GUNDuAVva6HrtkI3rBDm66XnlpzOn9rOK+UcHhg8yTeqDAemRmwDjQ2+v0VLNQEA==@nongnu.org
X-Gm-Message-State: AOJu0YzCUbxGUqLoT47x/XnsEpPI1ThsDoL81x1FG2Ju6fOj8LMwewJ0
 zgH+ieW0z+yHuMsPFZalPaHqMFFX/iDPHtYAGEaoUzgGfbaLUrDYMe7J5MOlPBOBv9VCXIg8fEz
 a2XqL6S5cE4nE2iemwGMOvMznrBkn2aTxakjRk8asU9gWKPpv8Q==
X-Gm-Gg: ASbGncuoZRxa9uyrtWx53A1kOmQpT67gM1Ug3noyo1y8BPDbUufk+oqDsN8VHIwJopQ
 r7HiWEK28Bm5s7Yee3D8fEz3VfaOUADqbJvAJcJZkuChgU7Z6qHloBxvtLKMoAqwLj2Q22Sbpjp
 czWoDrv1ktyQH2VK3U3J+2wZngATXyyDoBv8X+p31ENRzNvpzBQWGcYYU1nLJyMo96JJXTuCTO1
 ZKaHOq9YfO+iqP+COBV7PL/zxH3XaJOFuet/v8e69k2lcoIkwnGWH2ua/zFEAnuGgBTC6/uV4ji
 2MxhWArHGw==
X-Received: by 2002:a05:600c:4e56:b0:43c:fa24:873e with SMTP id
 5b1f17b1804b1-43eb5c20fdemr78918085e9.13.1743689095989; 
 Thu, 03 Apr 2025 07:04:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4e56:b0:43c:fa24:873e with SMTP id
 5b1f17b1804b1-43eb5c20fdemr78917605e9.13.1743689095667; 
 Thu, 03 Apr 2025 07:04:55 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364d071sm19166145e9.32.2025.04.03.07.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 07:04:54 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:04:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Udo Steinberg <udo@hypervisor.org>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH-for-10.0 0/5] hw/arm/virt-acpi: Do not advertise disabled
 GIC ITS in MADT table
Message-ID: <20250403100406-mutt-send-email-mst@kernel.org>
References: <20250331221239.87150-1-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20250331221239.87150-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l-mpOcBC3TICSUjaR970vOVlRGhlIusHd4bxNwErkec_1743689096
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.649,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: a03W43SkEKNc

On Tue, Apr 01, 2025 at 12:12:34AM +0200, Philippe Mathieu-Daudé wrote:
> GIC ITS can be disabled using '-M its=off'.
> When that occurs, it shouldn't be advertised in ACPI tables.

I doubt this is 10.0 material. How common is its=off that we
urgently need to fix it?

> Philippe Mathieu-Daudé (5):
>   qtest/bios-tables-test: Add test for -M virt,its=off
>   qtest/bios-tables-test: Whitelist aarch64/virt/APIC.its_off blob
>   hw/arm/virt-acpi: Factor its_enabled() helper out
>   hw/arm/virt-acpi: Do not advertise disabled GIC ITS
>   qtest/bios-tables-test: Update aarch64/virt/APIC.its_off blob
> 
>  hw/arm/virt-acpi-build.c                  |  12 +++++++++---
>  tests/qtest/bios-tables-test.c            |  22 ++++++++++++++++++++++
>  tests/data/acpi/aarch64/virt/APIC.its_off | Bin 0 -> 164 bytes
>  tests/data/acpi/aarch64/virt/FACP.its_off | Bin 0 -> 276 bytes
>  tests/data/acpi/aarch64/virt/IORT.its_off | Bin 0 -> 236 bytes
>  5 files changed, 31 insertions(+), 3 deletions(-)
>  create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>  create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
>  create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
> 
> -- 
> 2.47.1

