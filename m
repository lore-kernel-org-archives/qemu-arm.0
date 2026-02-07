Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8296EE0ADC
	for <qemu-arm@archiver.kernel.org>; Sat,  7 Feb 2026 13:38:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voiWI-000813-11; Sat, 07 Feb 2026 08:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1voiWG-0007yt-HO
 for qemu-arm@nongnu.org; Sat, 07 Feb 2026 08:38:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1voiWE-0001UJ-6j
 for qemu-arm@nongnu.org; Sat, 07 Feb 2026 08:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770471517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=RNd6CM/ma1Vs85PNWxVxexyygiqRdEMs6Umg4lQIQEhzpslBUzqWqQ86/vF2QDUzsEkSuV
 L+9E2PbdLp17n6pNwUYKK2O8q9J/o3E3NL1QeDSfj7aLVfmKAYBXArv39lIL1ygPXBJrWB
 4qpemFQQLP7VoyRCtKI8+p0h65z4oxU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-ifnNSCMpPFWvSrwir6VOLg-1; Sat, 07 Feb 2026 08:38:34 -0500
X-MC-Unique: ifnNSCMpPFWvSrwir6VOLg-1
X-Mimecast-MFC-AGG-ID: ifnNSCMpPFWvSrwir6VOLg_1770471513
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4363333c102so318291f8f.1
 for <qemu-arm@nongnu.org>; Sat, 07 Feb 2026 05:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770471513; x=1771076313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=f0Nz1qAvhevTGQZa2GHN3u5weZ2mSrkjlgtxiKjyv4B1sRKysDmhzl8uTj74kAcwgs
 MS3tEODouwUOPP/WmN9qmpeHoT90+RjiSGMmZkEfqAYgkEduVe4tIau520uansf0JHvn
 cVqVSERx/0SBEM2mefPeZMt3JnBLHrwJkJdoVw8wH8fYxcCfqmwiezV6N4KHuAs/1qDB
 9VxcpRmon73SUY/K2E3/A4XViP04FRWJ5LzmEDT5YnmLgLH2iMkQXlOg8uH6n98pzkoJ
 mKFwRhsy2fjifEgeWjwD/3UIGpaEi/ANNhRQLxXweql887IAR7M9FivROYMMIuc1XCkq
 +L0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW095538a47z7QaVovBj3EIEFdqa6RRGpaXwEP5P7MIbqJHo0rtk0CzHY0sdjXfjykeIkDyuehe+w==@nongnu.org
X-Gm-Message-State: AOJu0Yyghm6IsGUIztK/p0jmuggtKFeoGvTDbW5yzMzd3kKP2xvH2hFA
 la7uakK+TrOJEpE2Guh0ac/X1bdrgbDD51mazESk5PxOvIEkY4NHKgily0LKvbQpDL0E+7LqOTw
 3RKEXN8Y/XopQh9fEP5/HYD1/LHXggM6tQChdHIbR8KhuHGZ8n8Ng8A==
X-Gm-Gg: AZuq6aIPwcv3r+1DBsKq5WWFGJ4a0Qop92zaHXs9ouv7fAXHM65Rlu2V7k1FNpPKWL0
 txICblNOvzjfkbomGmKFgTH7iN41PQugOso/qkX/+4WMWjEt4NpzpeyGLKvG45UQ1QXBDWHieOa
 +RTrRkPgGlCQ+/xOYh7S7kfbk1N645f0mBcGRT6mc3BBJBUsvFrZcTRn7mN8FNP+NZuvk+NZtSp
 wZtkxLh5FQ5rpdEfpNEbzF8u4ByRg0MYIPkIKRaHHAG1BCNEctH4IDVnwkgd00wANTqVjHtE9P6
 UkaNYPFUVyeqXNOEry1785/SoV2+jMFgnivfmwAzx6ww5TtzdwDFlS/tzJJWGWJqZBwnYAZmxiy
 Ml0m+LBWj1ZyUZiCyuMZkxtD9Ife40/EPfob0k1KICI5QH8snHgUbNwzgd2zn2gmPB2x1QXZPhV
 2197Kt1qsQ21ZZjRTSju02KZNl8pPrt6qOo0g+7jEe/A==
X-Received: by 2002:a05:6000:2c02:b0:435:e520:d1d7 with SMTP id
 ffacd0b85a97d-43629386511mr9608409f8f.63.1770471512737; 
 Sat, 07 Feb 2026 05:38:32 -0800 (PST)
X-Received: by 2002:a05:6000:2c02:b0:435:e520:d1d7 with SMTP id
 ffacd0b85a97d-43629386511mr9608365f8f.63.1770471512319; 
 Sat, 07 Feb 2026 05:38:32 -0800 (PST)
Received: from [10.58.49.123] (93-44-32-35.ip95.fastwebnet.it. [93.44.32.35])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629756bc3sm12193306f8f.39.2026.02.07.05.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 05:38:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 devel@lists.libvirt.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Amit Shah <amit@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Yanan Wang <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Peter Krempa <pkrempa@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>
Subject: Re: [PATCH v6 00/27] hw/i386/pc: Remove deprecated 2.6 and 2.7 PC
 machines
Date: Sat,  7 Feb 2026 14:38:01 +0100
Message-ID: <20260207133801.628488-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108033051.777361-1-zhao1.liu@intel.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LSL0yBeGHbSAso-yWCZVL92VAGPcUAAaSzXCTfIfRmY_1770471513
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Queued, thanks.

Paolo


