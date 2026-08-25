Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27044C5DF94
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 07:26:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wylXz-0004Gp-Lf; Tue, 25 Aug 2026 03:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wylXy-0004GN-Mm
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 03:26:14 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wylXx-0001EC-59
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 03:26:14 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-84e27035206so1783524b3a.3
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787642771; x=1788247571; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=41vrC4Yj29c2G8CtpLKN0/veKnq17aQLpSmyUEQInh8=;
 b=jpT3Hsj0s8UqSqaEg8lQ3h4eFjbSiCuBx9Vfm/+o+Ba3tr6yVIELSncVgs/143dFKU
 aDcuKsrVkEnuZufRUCPaAy0njqnFQ0M3FPcLM58+WCHZbVDxScaRK0GSTEgr+MVc0UNF
 1CK/xgwcbbf8zIXa0FgbbFk28pcaVydQOxvBK/O8hghr/1Zlu9HHebZZTvzCNN+mLI1/
 /QsGxeJKryfyET04ihRa0iEOIK6emQ7L97NH4atmMFjjvvxLAUDML1RY/V9cnZJKOAHu
 XdqmGBm7swH+P6GLVR1er7Y4VAVx5GkL13WNQ2/aCVfWpgBz5lWuBaUJvN8hjiMF0Z/G
 kdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787642771; x=1788247571;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=41vrC4Yj29c2G8CtpLKN0/veKnq17aQLpSmyUEQInh8=;
 b=ng758xp892aBYJFZyby7HC7zPZ/0ujiI2dLihWHjr/1TCJeLBGW4i61qTupEIlg0RW
 VpMNWU5HrSCWSwahWhEaWUjv9o5Grx7pbtFSlEKGtJ+0fMQPt76O4ePajGErHSsTxdxl
 Kv1ZPqxZ/A/vIE2Anjp1BmmXHm/V9It6jzmJ56u7PVrTyUvghJwUS+WLUDcBhOaVwRQP
 ApikCIVKxPRGJAWJGsHKWJAV5KJFT3ONLY7qO7jTLU6McTzO3R8OGwzfDZfihg2IQ0K3
 FZSjv1UvYp0CZTWmw+wKTMgRwnI3rMJp2Hqah/v8mJcvAOzpsSVsGNCgpkRBqTed46No
 33ew==
X-Forwarded-Encrypted: i=1;
 AHgh+RrwIt8t1ctiUEs3f4JWHqMURIJLTiBw1mjmFRPgno1nS3+YDh+pcZ0TUAEQB9I+TlsAjYVDWnkkwg==@nongnu.org
X-Gm-Message-State: AFuF++kdXpNM9OKAX2UFKig4pABV3F2Q29Vmph1mRkBChntzdeFvPXlm
 G9UOBrPrO0iW17uUjCJ3FIfFi+gC5s/19ht4cF5+37zO+SNwbQQYMPACYygmdg==
X-Gm-Gg: AR+sD13LUVcAJ7buLNidqRdwzCU+Jt7RHABJSIqI0FiFHEBz9E3vRWqrJhVa1g2Iimd
 KnA7SE3W0/v6mzcx+HTwnDYLCShGXKBE6b/9b0tJf52fowk+8dGzb9kAtHi/iezjPjamZEXBsm4
 fSL1q7scRRuLSGkRS7i/K8buBzV3FT2VKdlRwLXwZLQxCgu/pmTgxKh2psVFtp+XztEAaPIq8au
 3oafXdRUuXCXdnID5SKwDcO3BuCgnE49vkAeCbizMiJttZnLrpXS25c6LaF5zrl5An09KC5ZNBT
 lkyjvv434conDtFs+/CtD7/af3hDlaOZqZO8gPnGULOMn1x5PEdTDTlXCvyj0W/s3quKbcuuSZv
 BuC7SKvsnyE9yYBfTn8Yn9uK8emmhXZqFgUYkgZ6r/ihEnqQklnUUjw4Y9M65nagjK4A1jMbmij
 oIVZ4pyul/RAUub9sJHgVvSwQYaPGFQfI1CnIUTwpjhdZmQWzLt4qMBdVaByM0XWy7uRt+pUcGu
 yKM/Q3O
X-Received: by 2002:a05:6a00:139d:b0:852:38ff:b4b6 with SMTP id
 d2e1a72fcca58-85239000a70mr13113615b3a.17.1787642771502; 
 Tue, 25 Aug 2026 00:26:11 -0700 (PDT)
Received: from smtpclient.apple ([117.55.237.216])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8520eed2293sm2569378b3a.2.2026.08.25.00.26.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Aug 2026 00:26:11 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v3 5/5] hw/arm: Add Axiado Ax3005 EVB
From: Jack Wang <163wangjack@gmail.com>
In-Reply-To: <20260825021155.2475879-6-kchiu@axiado.com>
Date: Tue, 25 Aug 2026 15:25:54 +0800
Cc: qemu-devel@nongnu.org,
 peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0A3F8951-FEC0-448F-B2B0-44AF0AE9777F@gmail.com>
References: <20260825021155.2475879-6-kchiu@axiado.com>
To: kchiu@axiado.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=163wangjack@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


Hi Kuan-Jui

In patch 4, the AX3005 DRAM MemoryRegion is created with a fixed size of =
2 GiB, as defined by AX3005_DRAM_SIZE. However, this patch passes =
machine->ram_size to the kernel loader:

> +    ax3005_binfo.ram_size =3D machine->ram_size;

This allows the value supplied through the -m option to differ from the =
size of the actual DRAM MemoryRegion.

I am not sure whether the machine is intended to support configurable =
RAM or only a fixed 2 GiB configuration, but the current implementation =
makes the machine configuration and the physical memory map
inconsistent.

I checked the configured memory size with:

for ram in 1G 3G; do echo "QMP case: -m $ram"; printf '%s\n' =
'{"execute":"qmp_capabilities"}' =
'{"execute":"query-memory-size-summary"}' '{"execute":"quit"}' | =
"$QEMU_BIN" -M ax3005-evb -m "$ram" -display none -serial none -qmp =
stdio -S | rg 'base-memory'; done

I then checked the actual memory map with:

for ram in 1G 3G; do echo "MemoryRegion case: -m $ram"; printf 'info =
mtree -f\nquit\n' | "$QEMU_BIN" -M ax3005-evb -m "$ram" -display none =
-serial none -monitor stdio -S | rg '\(prio 0, ram\): dram'; done

Therefore, the actual DRAM remains fixed at 2 GiB, while =
machine->ram_size and the value passed to arm_load_kernel() can report 1 =
GiB or 3 GiB.(QEMU_BIN points to the newly built qemu-system-aarch64 =
binary.)

Best regards : )
JW..

