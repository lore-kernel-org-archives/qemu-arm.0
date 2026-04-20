Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C8EF588C4
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Apr 2026 13:35:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wEomG-00067q-F7; Mon, 20 Apr 2026 09:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wEomF-00067i-Kr
 for qemu-arm@nongnu.org; Mon, 20 Apr 2026 09:35:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wEomD-0001D9-VX
 for qemu-arm@nongnu.org; Mon, 20 Apr 2026 09:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776692101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqk6bMsX2PsB474lKYgiEH+ZlR33fDYdf2OiMeOiJK8=;
 b=HnwZ5b21FNw7Tq8JjHEN5nZHopzkNGiTy8fG2cd8/hzFa93CXkaToO6Cx1+eSe/4pl2SgS
 WNi7Ui+6C4hlQo0p5/537Gkkmd/CCaZcc6x9p2bF4CE1Ed5e6PJI8zlMGx6cCp6kQpqvMT
 hfx3Stt3f4VX4D1jzL8WQQaB09+EzfE=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-uC0Ahu7gNzaEpqdSiUkQvA-1; Mon, 20 Apr 2026 09:34:56 -0400
X-MC-Unique: uC0Ahu7gNzaEpqdSiUkQvA-1
X-Mimecast-MFC-AGG-ID: uC0Ahu7gNzaEpqdSiUkQvA_1776692096
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-56f71e90581so2087798e0c.3
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 06:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776692096; x=1777296896;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fqk6bMsX2PsB474lKYgiEH+ZlR33fDYdf2OiMeOiJK8=;
 b=rx6AihDfY5ySSAKvIVrA3WZhPCmICK8GHqPhWbRUy/9pmAatzGB154kIBKkA8b5R97
 kBKMGuF8of5uXJsSZn4WoT4vyzxsYGlenjpWIlrBRs/Woy++yCxqpz02acLzQ1kXwi9b
 8AjcDMCRThcp8E9WwciqjrSLiqgjg8FUQxzfmb1+Ff+YENa9zRiyvbGdadVp8LE0YDGL
 cScocsvJmQt+SAuJ6aGfLw3476i5RUW9vzcwH84qcaVgS9XQp6RbHa/t5wuoMrhEGMGd
 J0x+DQODrNzleFJ9nikzks2rRNx+gQJrGYJEEKG1bkTPXOx8flEnjMgid1BLE3WngxWZ
 KrJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9f8Ylu3FBrnV1Dl1htwWe1K+wWmbbmYmW3PSdF3WgRI8UYY8j208HhmLErpv/2BBmrQS86QqA8uQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx8uvyVd+R8TqPoawxwFmZ+C58Z6ZlC6Gi7tc6r6qbIrWIOgNaV
 qriOLeX8e2Ev6tE6TEcNZwuXnx4UsfQY/GoUy2ZgNW5KDaZaeHiXfcotnkEEN5JK1S1p7nJ0nrn
 gZa6DHpUY9rBvBDKc4g3liZzG35u61dqpL37H62hPcTDamarCNWykSQ==
X-Gm-Gg: AeBDiev9mDlG9IiyZjvJRbfhVv1vhIBeAix8HJ7cyl5Y/RJfc3AUpOpz/RarT6Vz6Ir
 Muy0e320OUNMQx6QhSanr5UqguP6zEyvyRU7uOvk2cC9RajXnCAs/hEJltaHPvXcGeaViMyADWq
 mmk4QbaTilX2+M8b6+NpwQa1cjcGGqG3+hwOrMsg++VpurYkFyTvRFEzhYOvXEVA+sZ4vfmsFpT
 t7YTsRDuv8x8qD9m7j1FY+k5VVjmtIfCRgSQ0Ksq5rUBtWmoivi2Y9Etcz/el3DQsn6WvxFlq9K
 VSWkaHx/MK9H75fKWlIA4+/gv/Yftg1ftl+5EY3+HMkfIeIhehtsPZOS/8gaccGWvxZEg+qVhiz
 wlcimbirQvOmfvxGMDTslQ7wvfvzyuVH3MXqtSrWTtvIu/vkuDGhK+uG4fw==
X-Received: by 2002:a05:6122:829e:b0:56b:8e1c:582d with SMTP id
 71dfb90a1353d-56fa5a76856mr5100645e0c.14.1776692095691; 
 Mon, 20 Apr 2026 06:34:55 -0700 (PDT)
X-Received: by 2002:a05:6122:829e:b0:56b:8e1c:582d with SMTP id
 71dfb90a1353d-56fa5a76856mr5100567e0c.14.1776692095007; 
 Mon, 20 Apr 2026 06:34:55 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ae5eaf1sm77805746d6.30.2026.04.20.06.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 06:34:54 -0700 (PDT)
Date: Mon, 20 Apr 2026 09:34:53 -0400
From: Peter Xu <peterx@redhat.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 "philmd@linaro.org" <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH v3 06/17] hw/usb/hcd-ehci: Change descriptor addresses to
 64-bit
Message-ID: <aeYrfQuAsEaOpH_O@x1.local>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-7-jamin_lin@aspeedtech.com>
 <3ee36a34-573e-48aa-91e3-9140244717f0@kaod.org>
 <aeJNdLTRSZQiEiP_@x1.local>
 <TYPPR06MB8206C244CD249505E6B543F8FC2F2@TYPPR06MB8206.apcprd06.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TYPPR06MB8206C244CD249505E6B543F8FC2F2@TYPPR06MB8206.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pqvmOCWm-N04binw37_IMvXK1qLvaHKqxegrgiR8iLk_1776692096
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Apr 20, 2026 at 05:56:11AM +0000, Jamin Lin wrote:
> Hi Peter, Philippe, Cédric

Hi, Jamin,

[...]

> > > > @@ -2501,8 +2515,12 @@ const VMStateDescription vmstate_ehci = {
> > > >           /* schedule state */
> > > >           VMSTATE_UINT32(astate, EHCIState),
> > > >           VMSTATE_UINT32(pstate, EHCIState),
> > > > -        VMSTATE_UINT32(a_fetch_addr, EHCIState),
> > > > -        VMSTATE_UINT32(p_fetch_addr, EHCIState),
> > > > +        VMSTATE_UINT32_TEST(a_fetch_addr_pre_v3, EHCIState,
> > > > +                            ehci_core_is_before_version_3),
> > > > +        VMSTATE_UINT32_TEST(p_fetch_addr_pre_v3, EHCIState,
> > > > +                            ehci_core_is_before_version_3),
> > > > +        VMSTATE_UINT64_V(a_fetch_addr, EHCIState, 3),
> > > > +        VMSTATE_UINT64_V(p_fetch_addr, EHCIState, 3),
> > 
> > TL;DR: I feel like we still need machine type compat properties.
> > 
> 
> I don't understand this: Could you please describe it in more detail?

See hw/core/machine.c and entries added into hw_compat_*[] arrays.  IIUC,
if this is an important device and if we want to guarantee bidirectional
migration (I'll explain later), then we should stick with machine compat
properties.

> 
> > Details:
> > 
> > When a v2 stream arrives, two _TEST()s will do the loading, then
> > post_load() extend it to 64bits, looks fine.
> > 
> > When a v3 stream arrives, two _TEST()s got skipped then latter two take effect.
> > post_load() skips.  Looks fine.
> > 
> > When migrating to another QEMU, due to the fact saving vmstates always take
> > vmsd's version declared (3), I don't see how it can migrate back to a v2 stream;
> > it didn't know about v3.
> > 
> > Jiamin, have you tested migrating from a new QEMU binary back to another
> > old one?  For upstream and serious devices, we need to guarantee
> > bi-directional migrations, back and forth.
> > 
> 
> Sorry, I am not familiar with the design of QEMU migration, and I don't know how to test it.
> I added these hook functions based on Philippe's suggestion and review.
> Could you tell me how to test migration to ensure both version 3 and version 2 are workable?

Since this patch already modified VMSDs, I believe migration test should
have been carried out at the very minimum..  Logically if vmsd versioning
is used, we should also have tested forward migrations, because that's only
for that.

What I'm talking about is I think backward migration will fail.

Forward migration describes the case when a VM hosted by an old QEMU binary
(e.g. QEMU v10.2.0) is migrated to a new QEMU (e.g., after this patch
applied on top of master).

Backward migration describes the case when a VM hosted by a new QEMU binary
(e.g., after this patch applied on top of master) is migrated back to an
old QEMU binary (e.g. QEMU v10.2.0).

For different devices, we should allow different level of support on
migration.  Any device that may be important to either upstream QEMU or
downstreams should better allow bi-directional migration.  In this case we
need to use machine compat properties I mentioned.  I'm not yet sure where
EHCI controller falls e.g. v.s. XHCI.. when not sure, we can also just
stick with machine compat properties to be on the safe side.

For more info, you can also refer to:

https://www.qemu.org/docs/master/devel/migration/compatibility.html

Thanks,

-- 
Peter Xu


