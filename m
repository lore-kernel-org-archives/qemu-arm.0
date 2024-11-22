Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5308964njc;
        Fri, 22 Nov 2024 03:20:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWUvPoZVZDfvbY3swJ3pItV5rpUu6yNjbyC8eJ48J98aBhQaaepdRVAn5lMM5PihVqW71T4jgennyXJMA==@linaro.org
X-Google-Smtp-Source: AGHT+IE/WrXx5XHEunn0zml081osDIk1WLsDMUhmjN/kKLbSIdL6L3WhxHdHBg6N2Tsrc5aOqpKk
X-Received: by 2002:a05:620a:4053:b0:7b1:1467:e40f with SMTP id af79cd13be357-7b514653f48mr298799485a.62.1732274399588;
        Fri, 22 Nov 2024 03:19:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732274399; cv=none;
        d=google.com; s=arc-20240605;
        b=OtAsMA3RTrRusnV25n+4XnWnB4VjcKzbYColO7mFM5dqrT3IOsqXJSuVGrryjXVFUL
         Oo64Ap/+1w+bqc1nTohAl5Fk6dMstKL5oy32/TO4KGaHPNVJq+H7Ho25i0arDrsa3XIo
         rqtYFQC/F/b62kvlCwGAZdteKcNSbUtHc1uQPPIAi7kFww0zApjVAxRwR0JlqhHDATnO
         N1RGmslRok8IUxkqqj4jSBnlqVTavDjUh2k9prhWPAj1qyjm0EebGJZ27NCVeYSV/Ilh
         lD5S5f53/XZMQw0ueS/+NjAZ9K5nZ41zE5QpOsa9z7Lni7W0Zto7XPomea64lHA6UhV5
         vtcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mHjwH8Omq3FoUPGkcn+klfTPJMxEmXl+LJ5UDCnqOj8=;
        fh=PnWNGJJDb0y964RDcPfdLr1I0GcolFfgKgis7UgVTXA=;
        b=CaxCLfsYzFCEr6/ECdp+r72Ki0QB6/oYmU+1BpYXSegrSh27zXpaKs1wfJIx7JfB42
         tpAMVH2+HNeOeXt6hlhh0F3cyB4pHsFOvlPwwVmTUeoSKXCp3IVZGBm8LSnRL9EYTAN8
         6N6TWSFXnZugHIEhJoQejOrDYSC9uIrbg4dHsAnewQvj0QNhL6bVF+s7W9sPlkGaACqz
         0l4y82N8SidvSU7M8Cq52DkU+uMFjgEFKUqE4b037++7Q3EDjRuPYLkccq2hMVdwn58u
         MZNHgnHMC9sjn2IVCL0PBHblcAzujS54AS6U1y9RDHpZmnQI4ak0xg5/m+u4IDXsz2Hi
         A3SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bcaoGH6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b51403e81fsi198582985a.280.2024.11.22.03.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2024 03:19:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bcaoGH6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tERhV-0007ap-Sj; Fri, 22 Nov 2024 06:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tERhV-0007ad-2G
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 06:19:49 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tERhS-00068n-2s
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 06:19:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-382588b7a5cso1340256f8f.3
 for <qemu-arm@nongnu.org>; Fri, 22 Nov 2024 03:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732274383; x=1732879183; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mHjwH8Omq3FoUPGkcn+klfTPJMxEmXl+LJ5UDCnqOj8=;
 b=bcaoGH6XCRlmUrwfCRb+8BTb9d8P0vKSPHlAZO4pe4MAljSB7ILRK9RZsKRukxlhDI
 OSonueNCg73FWzSaq41OtxNa9bcpT0AeZRCnoTztlk63xxZvmRdeXJd8Zjwv/jpajP4c
 /Q0+wHvU9+L0l3b1e0JNAq/UXhE4YEuaIOnohoU02vW8MrTBBe02iVcNImZBQBuTEb5d
 KPfNB3G1LFDJoVeA9WPaTDvp94yt0pZhtiLrIbEJ1rO1e0tAaJGGX/7mj9g7mM2wO7lL
 ZqEnYUtNzQQ1rAJojHya/RuoWWjFsbBSk9Q7h4mMLJfLwitOAWHQ9GfrmspZhQyK78fF
 Tlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732274383; x=1732879183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mHjwH8Omq3FoUPGkcn+klfTPJMxEmXl+LJ5UDCnqOj8=;
 b=OGYvGfxw9a/kuTQE+TsUd1TPzHaO1QLVKid4jwKiH2OgOby2WSx+OzcZY0iessHulr
 lf/Pq5ou9rZi9921JVS8Nkg8radR1+1qlfqgbbQv4fJgYlM6R8DRswl5Na/NlcMmfjsv
 nt4Corsy1miru0HPJeptKYxx/64bzPB6Kx33UWf3Q224pdtUl0o9C2LfbeuB87DsQnmC
 bOL6j+s3HymW01a/2duAyonyqbBWKaHrIjLIqzdDtH8Q71MvTqTRD3pmKK/3PKIhdxuw
 d9sxfFt5kDLJ+d/S7y2d88Yf+zblC/6OuM4K1/jniB8hBf14ry0RRhO4rd8jrjNsp+Dn
 9m3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0Elv8HXn0fOOfeunoyaLJB5ns9CyE8CCuW/nb4G/+VBhFUj6W+s9kJkZRRlmLNCgMih9dyDR8OA==@nongnu.org
X-Gm-Message-State: AOJu0YyTfnRfTmRjh6LMORCoCy2zH6Ke3u5Xu+D3LcndCWsM6kSgyJ5j
 znjSBf5c/p4ZH85LorPjCk8ZU46rNCGaG2grWOckbtVcF0Hciix27rVYGq1oTTc=
X-Gm-Gg: ASbGnctUYXIm4h7LZUecRhgUgYZPcSMjOJ2JTOXVwa5H3WyIDp8idFbbhiIOGqdy1nz
 FK6qBgPs15magVzNLbiWlU+YudtFmbFTHHYa0EZFAu8LxzbmmKHdWvjHx/Gjxa8COr4fYPAOrz6
 rnzn+OoesibqYBN+XZQhhiF6Ik7tJrthaH/WsQISdzF2cMRiuOQtm5vhqCTUWs81X21/p7Fau+I
 7mYf6pZiuQH80eeJ+I6/FRWvLyPi8h3eJXlPqLp/L6BdavmPVPbigFIFj65f1HKq3bAZdUR7K8i
X-Received: by 2002:a05:6000:184e:b0:382:319f:3abd with SMTP id
 ffacd0b85a97d-38260bcb8a6mr2234003f8f.36.1732274383309; 
 Fri, 22 Nov 2024 03:19:43 -0800 (PST)
Received: from localhost.localdomain ([176.187.211.33])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad61b0sm2155786f8f.7.2024.11.22.03.19.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 22 Nov 2024 03:19:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Helge Deller <deller@gmx.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 0/3] hw/scsi: Cleanup around scsi_bus_legacy_handle_cmdline()
Date: Fri, 22 Nov 2024 12:19:36 +0100
Message-ID: <20241122111939.11936-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: X5oGmvoKwWwg

When a device model requires legacy command line handling,
call scsi_bus_legacy_handle_cmdline() in its realize handler
instead of having each user call it.

This applies to:
 - spapr_vscsi
 - lsi53c810 / lsi53c895a
 - sysbus_esp

Note, scsi_bus_legacy_handle_cmdline() prototype could be
made private to hw/scsi/ to restrict its use to scsi device
implementations.

Philippe Mathieu-Daudé (3):
  hw/scsi/spapr_vscsi: Call scsi_bus_legacy_handle_cmdline() in REALIZE
  hw/scsi/lsi53c895a: Call scsi_bus_legacy_handle_cmdline() once
  hw/scsi/esp: Call scsi_bus_legacy_handle_cmdline() once

 include/hw/pci/pci.h  | 2 --
 hw/arm/realview.c     | 3 +--
 hw/arm/versatilepb.c  | 3 +--
 hw/hppa/machine.c     | 3 +--
 hw/m68k/next-cube.c   | 2 --
 hw/m68k/q800.c        | 2 --
 hw/mips/jazz.c        | 2 --
 hw/ppc/prep.c         | 1 -
 hw/scsi/esp.c         | 1 +
 hw/scsi/lsi53c895a.c  | 8 +-------
 hw/scsi/spapr_vscsi.c | 4 ++--
 hw/sparc/sun4m.c      | 1 -
 12 files changed, 7 insertions(+), 25 deletions(-)

-- 
2.45.2

