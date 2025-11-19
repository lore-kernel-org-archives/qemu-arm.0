Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF3CCF58C6
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Nov 2025 18:10:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLmcZ-00035r-6I; Wed, 19 Nov 2025 13:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmcW-00034J-VH
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 13:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmcU-0002tu-JF
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 13:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763575769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0DCGaHtOp5reLxorwEtMOeyn9iP1bnDso8ubGDPMiBA=;
 b=gJ44lrST8kZ6Pb/8sVf1QZIDJnoLF5LovT3lEkXAB5GENhWXS1E4pyqwVa0rLy+J/UDuYo
 4vOJSAXbT4mZtei9/ykeuRa15Jq9zluLjjrK5u/AXAXOVzUjdMskHQgwn4IsDtGltyaQj1
 cO08hCy58gB7tH+QZOwI5+IWrymFy+s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-ZRvaagywMaGEQtDbAb4L6Q-1; Wed, 19 Nov 2025 13:09:28 -0500
X-MC-Unique: ZRvaagywMaGEQtDbAb4L6Q-1
X-Mimecast-MFC-AGG-ID: ZRvaagywMaGEQtDbAb4L6Q_1763575768
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-882529130acso440196d6.2
 for <qemu-arm@nongnu.org>; Wed, 19 Nov 2025 10:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763575768; x=1764180568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DCGaHtOp5reLxorwEtMOeyn9iP1bnDso8ubGDPMiBA=;
 b=KOGbBeP14me35sHyDl6JSc+ku2eSCxYbY6GH667+hgl8SL25ozVZfG4ClUpq6I5o09
 x/dlR0Wch11e2nyMuAbRrs8R6lXBP18/UeSW4Ifpz/hKSNEd4clxPqkhekgT6I+mAhwH
 EakNqQFcapFL9oNJwQIZtaTOJKe4Vm0pD789hEpI+sc0kZh8YSg/VWZ8Ic/G5Bsrz2DZ
 5UE8UHSByfaj/F0nRoZRj8grFGFC0pL7A+jW8ff4k2wZ1PVs6vTn5TVHRksFoQxVx5N1
 p+xLQi6OT56zkNjdjAINBxELN39Za/Iq+t4yd+Ipo7vNKHUjKVA+CwOLeDEpFkjqxNK+
 zERQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzuy7Hi6NLnxb7CIJyAhmjO1FYZUHvJtJNXomBt15gyGlKYOa3sMH02V8/CsvXMiwx/tjd/XQxjA==@nongnu.org
X-Gm-Message-State: AOJu0YwiLSyZZl235S275TXWakLn3VCy4wIS8pBNqplScnw1vqd+rysC
 dhjrBGD9d74qG/AGbGxlrovYNRKFGN/H7gl+GFH95ijiuic/BddT3mHx639Xyo4AWz2/Nsbc98N
 pvO/W7etiSr/S+0IsgmAQumj7QTee6Md6FSidVOJB3Y2L43ZVQGgANQ==
X-Gm-Gg: ASbGncuFgQ/lKwEDKGvcfUxj6jaOse05tgBhDQLdwi2TnJV3Azfb5uA0Hcq1/Fwi7q8
 Ebh3LpDlxqXFeLurWbeRBSFw6uo86tdKv8opZ5Gx9QFsJ1+iWacUlUhhlelFBAWR7Nuxt/8rnVp
 TsgZit01htTPkgDn+om7yhmDZ1kPysjN1Njzr5/GSg8AN4t6Z5XZPcgPv5yaarHEQ2FgqP9RKce
 Em2rLrZCyMjVfZw50a9ixz4nbiRmFuXIBm8/HY3pamZdOSI7kW6PQN1LN+rNAYaEFUKXzo8pHT9
 3WDpPskqFzGQYAPDcSOKjLXAqNQZPmX/T3YcAxdp8RXxL7ymt8fsJ6epZAY9DIYzhukhS5smC8a
 Yfro=
X-Received: by 2002:a05:6214:3a85:b0:880:5730:d3db with SMTP id
 6a1803df08f44-8846e054d65mr2568636d6.21.1763575767605; 
 Wed, 19 Nov 2025 10:09:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhcLsZHPo01FYGgTUQih5BLapAokqbeuAA+4Y54wTxOgNgHkwNxLSBBg1nI3YTS9Sdt0XpFw==
X-Received: by 2002:a05:6214:3a85:b0:880:5730:d3db with SMTP id
 6a1803df08f44-8846e054d65mr2567856d6.21.1763575767173; 
 Wed, 19 Nov 2025 10:09:27 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e445b1csm262086d6.9.2025.11.19.10.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:09:26 -0800 (PST)
Date: Wed, 19 Nov 2025 13:09:24 -0500
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
 harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 berrange@redhat.com, farosas@suse.de, eblake@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] hw/nvram/xlnx-bbram: More idiomatic and simpler
 error reporting
Message-ID: <aR4H1FyafbvOUw2c@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-3-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ofj1omv-l5hHHYdoeg6IF4B6F-q6PRcc6SMMKBMhTMY_1763575768
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Wed, Nov 19, 2025 at 02:08:52PM +0100, Markus Armbruster wrote:
> bbram_bdrv_error() interpolates a "detail" string into a template with
> error_setg_errno(), then reports the result with error_report().
> Produces error messages with an unwanted '.':
> 
>     BLK-NAME: BBRAM backstore DETAIL failed.: STERROR
> 
> Replace both calls of bbram_bdrv_error() by straightforward
> error_report(), and drop the function.  This is less code, easier to
> read, and the error message is more greppable.
> 
> Also delete the unwanted '.'.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


