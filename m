Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564A8CF58C4
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Nov 2025 18:10:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLmci-00039s-RS; Wed, 19 Nov 2025 13:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmch-00038k-CM
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 13:09:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmcg-0002wf-3n
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 13:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763575781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iWKuGlFXZQJhDckFQcgt5gxApYJTrA/9Towipm9l4OQ=;
 b=CGTnwgeGwbbN0YgTb4hgrl1iLdaUylAA2r+WMIzXkxeF45EUOH2SaVoUvQQrLcOIqyjYSx
 7VUoRYnbi+5KCwG3nCy7Ad+vNzHYB8CKPIj3yGthBrMQic0xDPxD/QhielG/gd2BpCMwWT
 Wk9esbDAcyYg4OTtRyqs8GC7cw0mNlE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-l2EB6QutNWSYDlLaxpIhgA-1; Wed, 19 Nov 2025 13:09:38 -0500
X-MC-Unique: l2EB6QutNWSYDlLaxpIhgA-1
X-Mimecast-MFC-AGG-ID: l2EB6QutNWSYDlLaxpIhgA_1763575778
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-882380beb27so537006d6.3
 for <qemu-arm@nongnu.org>; Wed, 19 Nov 2025 10:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763575778; x=1764180578;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iWKuGlFXZQJhDckFQcgt5gxApYJTrA/9Towipm9l4OQ=;
 b=YjyVkHrX8um/BJpCMl7lNEOYbPwL8L8C1GEl70AG6pkm3JxPR1Qrg7ibUxZB8cYP/m
 9dlQt4pk1QF3Esx35qpRbQZ9p4/dbNYmQ/TVc6v9M/4URwJn/pg5vYgyGhKACzM0/KjZ
 dhl8nKqBdG6WbuKPxNtNElddbY6N8mIwInTVhWn7DqohtQJ8nnPpfNhYXdwAROGGS2Av
 kb7WSLKYyJ3tQoWaftvgrWxM4Wzvt4r0Z+j7uRqVPem8vOYot1fhGkT60c7ftytznj7R
 Guzv549024UT6wlXkpSGx9ksm4YV89dvU1PMaWfWfc1ceB0ZDVZthlYoz8RODA5XcQ9h
 NEzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3fZqex9sxvg1Fo47tnf+RxQsDibGV7lZlCzBvhiW8SutRPZIT1TsQM3ZX9fVOo0Lo00fUQDqFag==@nongnu.org
X-Gm-Message-State: AOJu0Yw7Z0gvsMmVLjOjG89wOtRef5cOOzGROXwuJsFTRANw+nqG1rG+
 1emeUoJYEcSwuzZop+hc53shzqlkgXMuMPO9EOrU9ZgkF+K5VIVifEwhZcGSyt/BmAQBxHaJ5j8
 4SdcBLA1K3Rx04Ta0eHSFeTTde7lKQm8yUZA2IuQwaqxLdZKjzzgrJg==
X-Gm-Gg: ASbGnctLHhg2HxN3vV3pILOI78PJeJymqxdMQISOcGNCPRt1qguhS8kxRkHCQ1aC+Ki
 6zj/S4sQUUBlh5dTB4DktB6oqvkr8CH7FlaUtdkIvyEVck9e6YQvlIVuDZBiLYopUA0h89adR2I
 9uyELvYxCBpvOhZpFsjYsjFYUg27igJ7LBcyxKK77XsQn0c9gXjumwxEVHgobctOiFzXcnnlx97
 2lWKQrAHE86F/HfXifHMSo5uf1HQTg+x1BXPr9hOwYXI61mo1TXfJYjlGVQDOoCkcVSgMtjsK6a
 0vln1WntHjkjF68ulItmNLnqDEPF2WfeMZpSX14jjTAz7W/8GjRGUCYDF3wtGLsCCWhl9DzY6aO
 DoFs=
X-Received: by 2002:a05:6214:33c6:b0:87c:a4f:afd3 with SMTP id
 6a1803df08f44-8846e02d57bmr1889316d6.16.1763575778012; 
 Wed, 19 Nov 2025 10:09:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELSahBwRm5SxgULUmKqEQouDGBl9IAYstEeLqOk0A49a/xIWSs9mc1bJ81aMUBPzhLGlz0ig==
X-Received: by 2002:a05:6214:33c6:b0:87c:a4f:afd3 with SMTP id
 6a1803df08f44-8846e02d57bmr1888776d6.16.1763575777665; 
 Wed, 19 Nov 2025 10:09:37 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e445bd4sm265876d6.10.2025.11.19.10.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:09:37 -0800 (PST)
Date: Wed, 19 Nov 2025 13:09:35 -0500
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
Subject: Re: [PATCH 3/5] nbd/client-connection: Replace error_propagate() by
 assignment
Message-ID: <aR4H3-CQ-F8ZUN_Z@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-4-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vGPlPI1nO_70Rho_gF33TNk1Cu2milYnKoFgAA4M3s0_1763575778
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

On Wed, Nov 19, 2025 at 02:08:53PM +0100, Markus Armbruster wrote:
> connect_thread_func() sets a variable to null, then error_propagate()s
> an Error * to it.  This is a roundabout way to assign the Error * to
> it, so replace it by just that.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


