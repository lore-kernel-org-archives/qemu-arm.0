Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81338CF58C4
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Nov 2025 18:06:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLmZi-0001b6-1l; Wed, 19 Nov 2025 13:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmZg-0001Yc-9y
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 13:06:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmZe-0002jt-Uh
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 13:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763575594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxKk+ZBrfy+3vEGqZdJgfoqPz6L6wSNR8CNOxVRPE4c=;
 b=QZMQ7R7+HF5tQ6rTsV7s1TF+WOkK9P7VaCFiuWTe4N195j8U6fQ4p98B5w56UYf16GdK1u
 MDRsASzPghNPxWgVJUbNKj9F+k3waUs7s0w7yCeVso6syKQIJnnzHCGoq8ydatS1b4QlZu
 JIvVko5hVhzGoadf6HGsfUKi2Y1XEb4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-humjyhUrMY-zomHPSkDukA-1; Wed, 19 Nov 2025 13:06:32 -0500
X-MC-Unique: humjyhUrMY-zomHPSkDukA-1
X-Mimecast-MFC-AGG-ID: humjyhUrMY-zomHPSkDukA_1763575592
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8826fb20ef0so983106d6.0
 for <qemu-arm@nongnu.org>; Wed, 19 Nov 2025 10:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763575592; x=1764180392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxKk+ZBrfy+3vEGqZdJgfoqPz6L6wSNR8CNOxVRPE4c=;
 b=WsTRrJOTxPlFcbe0wgIPk3ZwLStfzVegR/k3z0TUPZkvzLRUlGQKaaL1cnOaQhX5oC
 kll7KdoiY6OPxCWnjR00yVSRCc5n0IiZOIrtLRe5LqdCykXqIO+t0seYuhUVgo82MqT0
 5f2nme9y2JzIysZQK012/1xNtBUd3LeYvCyAyTMN4JuXi4m2tOlyhAE/X72zixtBByHQ
 r1XWey3g8nhFNrVap1GWhnY3z50XO/yrAXy0RRI3bqwrZNQtHCllWPfvD2ayJeaC3dIt
 BSul39ufmnqc1SBpwrtI2ePqymPyE8p5YE0EF8UNAfHxZrqZcsUieZgcqYmouNZqoL4x
 SMfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTx3GHY+ZOfyDUXw4DdS9wD60VWjhoPghKAU70EmqWQerSx3L51w8yFrorcOOq6vly1DjiMZrA1Q==@nongnu.org
X-Gm-Message-State: AOJu0YwHlkgDrlRPuEhr3DMHioIsycxn3Inaujakz0b+51GbmqCAtVk5
 jHrCJQh/n0jbZ0SbI5h8oIC64WwhRJim/JJNbWXROhPASHW6VVkFg6p+9PJcPrchO77v91djipA
 TihPEuZLmSQNmtDHzBFMk9v6Xkupcyu98qiWJ+vSVT37KW+SJqEY3uQ==
X-Gm-Gg: ASbGnctCZS8qGsJhfOc+AawJapUafbh7XMqyUP4M7YIlQ7Zscp7vqE1C2t8sXlqcwP1
 DSCe/cPyy6fx8+RnnWVpS2el+laP8bMR5KDo/3DYq4xpx87X1APJONjGFdkJwbD8zO1bEX7aGf4
 QwNxPUL/0pKWDqY97m3aptIZ4xm2Mb3A6OlitVL3r0WbHY6RIxeu77zxefsgkfIW9Ar20/pkCBC
 29/UfKpR9upSWbN5klyaI/t898piaLJeOS/NwGXFYP7rmn+hnqjT6XFlGAqAaR/p4Xg1aJbbs04
 FA+lJn6wAPOIIkpYLNmnuZ0ASD2Dd8AHH+na2Ot7VGrMOhI4c/ZPVHBNqz+EC/+PugPFAePjEPB
 mpkw=
X-Received: by 2002:a05:6214:20ad:b0:880:48c6:acfb with SMTP id
 6a1803df08f44-8846e1d1ee1mr1615926d6.49.1763575592042; 
 Wed, 19 Nov 2025 10:06:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA3KddVigP0uQkMDW+wiQ07QNB1nQ4u8CPelnAOsxIbSfbRmY+sPznvOSd7uBlcPTF+2F45w==
X-Received: by 2002:a05:6214:20ad:b0:880:48c6:acfb with SMTP id
 6a1803df08f44-8846e1d1ee1mr1615226d6.49.1763575591593; 
 Wed, 19 Nov 2025 10:06:31 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e46a846sm181466d6.18.2025.11.19.10.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:06:31 -0800 (PST)
Date: Wed, 19 Nov 2025 13:06:29 -0500
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
Subject: Re: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
 simplify caller
Message-ID: <aR4HJQGqCswwH022@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HgI4gGrOAMZtumSzxBVa7p6DNITSXNepoV9IgzBpxtU_1763575592
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 19, 2025 at 02:08:51PM +0100, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


