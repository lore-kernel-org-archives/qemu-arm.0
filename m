Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45562CF58C5
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Nov 2025 18:05:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLmYR-0008Qd-Uf; Wed, 19 Nov 2025 13:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmYP-0008PM-M8
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 13:05:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmYI-0002Yf-Mn
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 13:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763575509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sLup+W7pa6WZ/k6QZNaZVOA124clRvPAt6nyoZoANYk=;
 b=WfA6K/eyjkISKvtrGVm5s3WDSHBT6b5h9L5WAScUeCb6fVd5iPJcNh/uViMnYCGtRj1m77
 sQ3GFNQ/jeqEWgHpsMfRcM36NFBasiOIRC96RT8RgnNJ2T+YeTVimyzrxPJAfTEoxT9zKy
 MPLNk1+aqFYH0QaxIa4W50yxYArJ3QQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-aJEzfytCOVSGVxASY0qBeA-1; Wed, 19 Nov 2025 13:05:05 -0500
X-MC-Unique: aJEzfytCOVSGVxASY0qBeA-1
X-Mimecast-MFC-AGG-ID: aJEzfytCOVSGVxASY0qBeA_1763575505
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8826a2b2d9aso578606d6.1
 for <qemu-arm@nongnu.org>; Wed, 19 Nov 2025 10:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763575505; x=1764180305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sLup+W7pa6WZ/k6QZNaZVOA124clRvPAt6nyoZoANYk=;
 b=rPOkMBuZu2gySDT7mu8GA3ELSJafrj68T6gCYIaUPCdJlAuPj2Nt9WepsRQgc793T2
 0twBU3DwTZ9NTwy0x3e2vNadnXKfut/h2JldGJpzwDcfrpvEX61yJKb11RheNcGGt7YT
 tTxUFCvK3LUOJDuoYWngBwb9ok8LjRLbFuNME82grwY0MnI0I9xaCcvcujlkiYAJmXIw
 5Lr6Ii24c+zFuTIEALXy7N1sbDiGN1/pu29ZGfU1McwFp229K0TbPkkG+yC2heFEPsIR
 6TwxsU2NEP6j2r4b6spf7Zbab3S/0OOeMSQknQvaYTNJzvaqhwGUUUFYpgMzjZfUfJFA
 fOWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRSvrh6hsDHxLS0hH3QAghEEP0RW6o0ZjZuSzgzOGCXPkvQ4qm8yJnc3Yi7TvCUIznNUjs15ZnwA==@nongnu.org
X-Gm-Message-State: AOJu0Yxxe8cBd1CzaijnjTDU6EkExitICZV93A5OYs1Q1lGhluXu7YbC
 COk88y8+Z9IWuQ+VFNkGCRnKDvdQ9FcWm1X2jozwQCKmhfj8LwyYInkBE++Z38jdvdX9RLAG0W/
 PA1mftpwGUgIU5In/XWjIUosPO49xfccdQr969c6cNTyqIKzo+MK3Aw==
X-Gm-Gg: ASbGncukrkb7ilLXL839DSATJbT1AFJ5c1Dt55zwGNAsgSdPF0IrRWinWAfWsJSbyFi
 zWNOXRpAMMVVrLTebnrK8Rsho5/qeCx0/0ICPiHqEjxec+kiiEVI1D6VnSxxDH4icuzuKHioeJR
 El15omSV4ksu9ovABAOsOi/0SCWpZgorL2XuXzwciPWDif9Nx8hdvcLT3YKuhjgpkIt3gDnbCrA
 HP9SqUfLpbppwxVRKXXApcxIV+fQWJDEdBVZichNL3VKKaRjB7+rmrqxDp1qD0QSwEXNdX3cCJ6
 21D2velty58dJGO6Muucl22btzqlBCkoSf8MVApYdU966nlVNppoSXxOzkjeJkKt7jtN/lCV2U7
 EokE=
X-Received: by 2002:a05:622a:1915:b0:4ed:8fa:6fc4 with SMTP id
 d75a77b69052e-4ee4971d531mr1625191cf.78.1763575505172; 
 Wed, 19 Nov 2025 10:05:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyg2JyzSrFhB2LMApC4ECHgD7juQRduC9UIz0/PCIU7u2oBKhMX1CSoSw3khRb1Qff2CShKQ==
X-Received: by 2002:a05:622a:1915:b0:4ed:8fa:6fc4 with SMTP id
 d75a77b69052e-4ee4971d531mr1616981cf.78.1763575499123; 
 Wed, 19 Nov 2025 10:04:59 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88286595ea2sm138610226d6.51.2025.11.19.10.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:04:58 -0800 (PST)
Date: Wed, 19 Nov 2025 13:04:56 -0500
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
Subject: Re: [PATCH 4/5] error: error_free(NULL) is safe, drop unnecessary
 conditionals
Message-ID: <aR4GyA3nfvelqr7i@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-5-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-5-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tc0yr-v3TQaIoTnW9bcLSJw4OFk51afOin3QxO3K31Y_1763575505
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

On Wed, Nov 19, 2025 at 02:08:54PM +0100, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


