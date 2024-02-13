Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp53887eje;
        Tue, 13 Feb 2024 03:04:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU/nd6dgL4ZKXPZzzEAEpNcU58jqJmueDVBUPbFMttq5KprIpAsEfyvFKF5KakRbS9n/G+kOZrit8UOUX3PWXma572E/h+D
X-Google-Smtp-Source: AGHT+IFtz01zyk31t6J4NL79Szoyp+6TYn8i0YRWxMcz4yccPpje/eD7vC81O2X8KcDYbW5Z8KtP
X-Received: by 2002:a1f:da84:0:b0:4c0:2c31:f7ab with SMTP id r126-20020a1fda84000000b004c02c31f7abmr6042993vkg.11.1707822291387;
        Tue, 13 Feb 2024 03:04:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707822291; cv=none;
        d=google.com; s=arc-20160816;
        b=BdzaEO9/190ycXbnUHlU/FcOwqvNsLDJDNUYsS4wsU4k2OVj0wdlvdC9dtAcVgttjC
         TxNr1Dv649SgTVgbqATgWbowO9/3iXOQFbC3FH7I7ALHSSGoDnLJ9oJS4c1rZ5W6pG5r
         ZbHbUba1pimnAyTya5+LWLjwhYQvftiNnErLA3tUii2um12S/mYPVGaYmytHycKxIiRM
         bONvddXy039Moe07Xq+5AZQyRA01iKS3ohbipM9lWBjC90BGV30iy33gOPDNHC7HT1PM
         +ciaYV91Gzo//kFSUuCrGRlkZLZnYpzd8ucFhXgI/FYWrkXPWa0UAdfkDnjHnO/8yyk2
         Rzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7N91lAjYUSFlOt3VaYvlm2zqLY+7pJrej0nvLjkSvFA=;
        fh=bC48Oiv0g8EucWGsgGeW+rYanQMux3Bx7bNFg/yoYNs=;
        b=e2QpXgulWmFkr6MvOLza9LtOq3akb0HCi1OqwOri7khVDErhYnkMyUzSSqlfGBxOTm
         rJ4xnGRsWa+cNUN+RadO6pOMD35k/hM9Lgwvu/EUN1fEXfrsErsmRJ8Si5pcJ2jxNvTT
         CUSwyfK7MedXAVyS0d2K2OGdeaURJBXb2vK8bLznZhn8jD9/7xbPEklPCDtKYfq/gyt9
         Js/oqKQqf/dbfaCqgznfWEeysTbiYP+Znign1duim1b59Qc5l3w4HLroXx3HuEnh7OzP
         YaZEBNZkiDHGOiIW+LsBLFn/0uMV66MDe4OWp2CvxYvUs7CuxssRBJsTWhMb7HpGKSJq
         FXdg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T9VTJmob;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCWIjzAGOeosrj2lo6E9InGR+TjIweVc+XIPLEMW6l/6fXAfCtK8rsg6j0nWFJux4rb3ZLKBqMgJXaE5WLRbNxn2Lu5oWump
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05621421ad00b0068ed862e6a0si1580407qvc.72.2024.02.13.03.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 03:04:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T9VTJmob;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZqal-0007BN-IU; Tue, 13 Feb 2024 06:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZqaj-00073g-SA
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZqai-0006xo-BO
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707822282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7N91lAjYUSFlOt3VaYvlm2zqLY+7pJrej0nvLjkSvFA=;
 b=T9VTJmob8Hkdf2kCEJZ+8myQ2Q5mq9fC8Nw4PPvFE8QuKbqPLBbFfvkcWmd1EXO41tuYkZ
 h+ZpkjDiVVuQvK4V4j653Tx+EIuZScuiSsMdMeOS7XXdbPCh1tAKPO1Dp7ogfMJRSwTGM0
 kdlRJjjhmw43aVLtlJfRwVASKtDupSk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-rYb7NMNFPH2KtlZmWzd_tA-1; Tue, 13 Feb 2024 06:04:39 -0500
X-MC-Unique: rYb7NMNFPH2KtlZmWzd_tA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a3cdd79d960so45114166b.0
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 03:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707822278; x=1708427078;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7N91lAjYUSFlOt3VaYvlm2zqLY+7pJrej0nvLjkSvFA=;
 b=JUvnouTLjh2W46hOKXNY34lDxs6kP/AwKvt9K2pBYYO3kiK6D5MpdipSnjv+nL1s/j
 gVbx7J7g+2NQ7GA0nuWFbswoXoPXKcLUZsQz8w9kUYQ0KRnRMM8OgxCuVRzoDCfO/+C0
 mRBcvJy/g95DVbRlGMjp4skLZGdSOi6V2vSwzMw0r7HZvOcTfAYWoBAzZ7eNdSipQ6+T
 UJcjFark8pTLd3P/t36KY7mv1nWMFr3Xz/QuajcLmGzkMZXXGkXm+iA2qr6oX/8HJFDl
 C5Bo6BsSnT+lYXMwDkifj0Dh5NdDlfsqhERomfwMtqBovDfC52k16qd8pEn+qUgtgsYE
 5sNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzr1gY1fpcv9yofspcBwn7oCwspgEGXwAJWeDVj/OAIpXImTEcsATeJwDvQZBwTULZtVM3SHdEVDYs5pOxZiv6zC3X
X-Gm-Message-State: AOJu0YzZkjYOpXb5yOJzFut1P77J/jc24kJwAMTkv2h/+vt5B9ce2tt8
 vk76Y0Mu+4RWAJUCEt2Ig7cXlwmgF6qvFMJ83wl4Q/eC/E4zMiGGiYYUR+WJ+tYxuJFcy9etOhP
 bkxL3PS5YlezdcETDODSFi/rT49sanYb/be8zeQUgFN/L6Kr3uQ==
X-Received: by 2002:a17:906:3e1a:b0:a3b:fbf8:94ca with SMTP id
 k26-20020a1709063e1a00b00a3bfbf894camr6202078eji.62.1707822278191; 
 Tue, 13 Feb 2024 03:04:38 -0800 (PST)
X-Received: by 2002:a17:906:3e1a:b0:a3b:fbf8:94ca with SMTP id
 k26-20020a1709063e1a00b00a3bfbf894camr6202055eji.62.1707822277843; 
 Tue, 13 Feb 2024 03:04:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWEY839uy/ih3ICWjt4iu9TPBPeOCERzXX8Wvr4nNAXHn6s/PyCEtqiV63f7L98N8TEZy+bqJ0w5h5tZG3IOz2Di7lGJawIujZjX/aGulCju4D+zJBe3y7Pdsl9j+1YIwjW5rNen42I8Cqs1/0+Gy7wLs0djZtmEfEz9n7LZgip4wIPlFPW13FJK3/GYeXlAQDm7/XBRaM585wOi/bLLMqERXoYlfLCCEE/drvxCbDOn0yfkRMjUlRMYON7cXFaeVHz3tg5TZVyByKliAxcQ0za
Received: from redhat.com ([2.52.146.238]) by smtp.gmail.com with ESMTPSA id
 hb16-20020a170906b89000b00a3c20ceacf1sm1173049ejb.118.2024.02.13.03.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:04:37 -0800 (PST)
Date: Tue, 13 Feb 2024 06:04:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 0/9] hw/ide/ahci: Housekeeping
Message-ID: <20240213060343-mutt-send-email-mst@kernel.org>
References: <20240213081201.78951-1-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240213081201.78951-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.774,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 812jUm6OPL2a

On Tue, Feb 13, 2024 at 09:11:51AM +0100, Philippe Mathieu-Daudé wrote:
> - Split 'ahci.h' as sysbus / pci
> - Inline ahci_get_num_ports()
> - Directly use AHCIState::ports instead of SysbusAHCIState::num_ports


PC part:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge with rest of patches.


> Philippe Mathieu-Daudé (9):
>   hw/i386/q35: Use DEVICE() cast macro with PCIDevice object
>   hw/ide/ahci: Expose AHCIPCIState structure
>   hw/ide/ahci: Rename AHCI PCI function as 'pdev'
>   hw/ide/ahci: Inline ahci_get_num_ports()
>   hw/ide/ahci: Pass AHCI context to ahci_ide_create_devs()
>   hw/ide/ahci: Convert AHCIState::ports to unsigned
>   hw/ide/ahci: Do not pass 'ports' argument to ahci_realize()
>   hw/ide/ahci: Remove SysbusAHCIState::num_ports field
>   hw/ide/ahci: Move SysBus definitions to 'ahci-sysbus.h'
> 
>  hw/ide/ahci_internal.h         | 10 +--------
>  include/hw/arm/allwinner-a10.h |  2 +-
>  include/hw/arm/allwinner-r40.h |  2 +-
>  include/hw/arm/xlnx-zynqmp.h   |  2 +-
>  include/hw/ide/ahci-pci.h      | 22 ++++++++++++++++++++
>  include/hw/ide/ahci-sysbus.h   | 35 +++++++++++++++++++++++++++++++
>  include/hw/ide/ahci.h          | 38 +++-------------------------------
>  hw/arm/highbank.c              |  2 +-
>  hw/arm/sbsa-ref.c              |  1 +
>  hw/i386/pc_q35.c               | 19 ++++++++++-------
>  hw/ide/ahci-allwinner.c        |  3 +--
>  hw/ide/ahci.c                  | 29 +++++++++-----------------
>  hw/ide/ich.c                   |  4 +++-
>  hw/mips/boston.c               | 14 +++++++------
>  14 files changed, 99 insertions(+), 84 deletions(-)
>  create mode 100644 include/hw/ide/ahci-pci.h
>  create mode 100644 include/hw/ide/ahci-sysbus.h
> 
> -- 
> 2.41.0

