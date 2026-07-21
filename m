Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F270C4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 16:29:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmDKP-0001jq-RP; Tue, 21 Jul 2026 12:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wmDKK-0001jI-VN
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 12:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wmDKF-0000em-8f
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 12:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784651280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=peKFTWHWFOH2wI/x2JGjvWU2w+n3RfJucxy4ZWT+h4g=;
 b=VXf8KsaMxkD9mbqFWf223iuBB0BYwmlGJuXVOza6pMRZjeNf4T3NTC98UykJOmMgBQCcpW
 fWRkSglWSrKbDy3fZ5R85hzlVXSxpBHzCJS3vdO4yPgLwLypkGBhUr7lCVOdQnIF8kWIQr
 J/UIK/4lKcK9k8QQzePcWsyoEM8eJ5c=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-eSZAvP5POPCwt73DaRf5IQ-1; Tue, 21 Jul 2026 12:27:58 -0400
X-MC-Unique: eSZAvP5POPCwt73DaRf5IQ-1
X-Mimecast-MFC-AGG-ID: eSZAvP5POPCwt73DaRf5IQ_1784651278
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5c125dede51so2051448e0c.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 09:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784651278; x=1785256078;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=peKFTWHWFOH2wI/x2JGjvWU2w+n3RfJucxy4ZWT+h4g=;
 b=XCbLvvYdGvjlCBQKvdAqo0/AdWNdZU9+7AP6dGYAWDlQlPE0Pb7aIh4H2tFHg8Q5Yi
 ZSoCAqLYf0tR7cqkUX56FUiDUQzyWhjnbHq5jTffqQBknrkkTkDsxJaDKjOy1I67UebU
 Nb1WH6MIdyiLjIXR3J/3rG/n9hyfdWbZXxBZuVyDt6IiLh0Vd1Dj6Xn9CbKysz+/RRwl
 olTqmQoo/yzJlOzOwsSQDa5p1G5bdf0YRcc6axNioV6jk7E1OJ/UJy9iyLPr7teKtvwu
 jLVtGpf1C/3/Mzrkpu6r47Waq08qFGN1JLWhZMOLG/U00Ij0geHDcjVpRH3xkmejQxsi
 YZHQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrxgXcF+1qWdvAIiTCLUWzPjAkJovsnhs2DlU/bJXz586u3lwPpjFmX9AxhHP0BFDfE0TuXFEDkug==@nongnu.org
X-Gm-Message-State: AOJu0Yw2K9SyiEZsJDkMUOtGgeRuLHALrSCVd9FX5qRMrt9imdw0Ord2
 QocXnvzaCraJ3w/rzekVvQ2sRlhY8Gb6/t8BsM6qMKyJ9ePGy5eqy5O168T1zINyeSxKz4LG3y2
 WD6Ni4KCHmMB56iJ6ZJ+l6cVD9aKTDN+034P3bIi0vsq7/a10dpF34A==
X-Gm-Gg: AR+sD12pR+MMK5bJnxDDrlwXYisGYkqVgt4PxY9/rvwaLCR5n5H28ecS/WmC+H8NrrD
 5cKZLG/bMpDWZ9QeOqLtSd2oB7bPKU6TCx0PoNgHAK/KqMAR1+EJxmXshTTNQ4qYh2XqEF4+yD4
 DXCHHQzMTz8ox0GkVkOPoGSMee6BA7NrkuWImjDMxOX/XTBUwAI/w2qwINPxEupDEoAR06RkaPE
 GvxUfH2rZyvzPeJ6RulowpLjaHaftx07XcPS8aj/kqwDYFzQdQgme+7ro7WE0alNBlJZ60gnI0p
 sMPYqRAuzGjeItNv+Nohic3WdHDPnn+nc48gbjRXpVlu6SmL9gYWfVzn0fz+DvSWKRoQANMBGh7
 NHrZupwttffak/Qt/CT2RYKPM5hAfyEG+dwWapvXZi/NnK8hxLNlItR2M5Rw=
X-Received: by 2002:a05:6102:d8e:b0:729:65e:f08c with SMTP id
 ada2fe7eead31-74753146d97mr5850106137.0.1784651278058; 
 Tue, 21 Jul 2026 09:27:58 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:729:65e:f08c with SMTP id
 ada2fe7eead31-74753146d97mr5850060137.0.1784651277372; 
 Tue, 21 Jul 2026 09:27:57 -0700 (PDT)
Received: from x1.local
 (bras-vprn-aurron9134w-lp130-03-174-91-117-74.dsl.bell.ca. [174.91.117.74])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-747581b09absm12522517137.8.2026.07.21.09.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 09:27:56 -0700 (PDT)
Date: Tue, 21 Jul 2026 12:27:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com, qemu-s390x <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <al-eCtxGjG4HHEbl@x1.local>
References: <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
 <20260625123119-mutt-send-email-mst@kernel.org>
 <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
 <5faf04b9-d596-4a1d-9fe3-5e9ad5f0a99a@redhat.com>
 <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
 <20260717091756-mutt-send-email-mst@kernel.org>
 <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
 <20260717095407-mutt-send-email-mst@kernel.org>
 <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
 <59882c5b-545d-4768-8bf4-723fed97a801@redhat.com>
MIME-Version: 1.0
In-Reply-To: <59882c5b-545d-4768-8bf4-723fed97a801@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DfuNaJmSK_LpiCkElG3xeIx5t875Vq63DWwy7xqNQP0_1784651278
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: permerror client-ip=170.10.133.124;
 envelope-from=peterx@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Jul 21, 2026 at 03:37:53PM +1000, Gavin Shan wrote:
> If Peter is fine with two variants for x86 and non-x86 architectures.
> I can post (v4) for further review. That will be something like below
> and let me know if there are any other improvements are needed.

I have a generic question on the "unaligned access for x86": I think the
question is about the one Michael raised here on unaligned access may break
x86 here:

  https://lore.kernel.org/qemu-devel/20260617022330-mutt-send-email-mst@kernel.org/

  3. (theoretical concern) also on x86, unaligned accesses are
  possible on guest and host, so converting an unaligned access to a
  series of aligned ones can in theory break devices.

Is that a real problem we need to consider, or can we start with unified
approach and leave it for later?

PS: I apologize if I missed important piece of info along the way; I didn't
follow closely on the discussion on this topic in the past few weeks.

One thing to mention is, what we change should only need to affect
ram_device, AFAIU.. so most memcpy()/memmove() shouldn't be changed for any
arch when it's pure RAM.

Thanks,

-- 
Peter Xu


