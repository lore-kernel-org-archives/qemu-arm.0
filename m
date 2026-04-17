Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC3F436B2
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 15:11:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDkqS-00060v-48; Fri, 17 Apr 2026 11:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wDkqQ-00060f-Gb
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 11:10:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wDkqO-0007Ra-Aq
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 11:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776438653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s92uyUk+uNDIf6n63xBX8YC66tbvXrwMqpU+Qn6/kNw=;
 b=jV+UW7YoijBFJhyx4Bbs1yGqoPxB+oGHAIh3JY2Z15LG45JP5qODVnIz/0eTIj454Lk/L+
 tyTE/LpmxcjOq1NaWD3B1FZY7OZ0Lo9YcpEAIdm0ayk5lVceq0DD0EtWTgrwgcnHGCeRux
 xomM8e1uQoijDnOOv+aeHSnT0VSgBwQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-FMrgegdYM72yIV9JHlHRtg-1; Fri, 17 Apr 2026 11:10:52 -0400
X-MC-Unique: FMrgegdYM72yIV9JHlHRtg-1
X-Mimecast-MFC-AGG-ID: FMrgegdYM72yIV9JHlHRtg_1776438651
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-43d76eeb303so822141f8f.3
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 08:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776438651; x=1777043451;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s92uyUk+uNDIf6n63xBX8YC66tbvXrwMqpU+Qn6/kNw=;
 b=VWBEKeOITFsv0XoTXrBZt5cC7kGrKvun2b4GjOejQxr/7uc1PWy2nx8QfAy2BKaay1
 eKFUHkPPWrdftEUMHQrYbX3sVa9mdv/70VDnupVmQeXfe+2cacNtnpFipuR/0OH6o80S
 mM+f8M5U8Yuwbnzy+puvmACYb3Yrzr+l/EEXFNo59Pc8vtCs2c/fKP/DLCacg406Pz9U
 S2pcrixCvVkXMRFFMoL1BV7rOCfri6x/FfrV0qS7/umC94npWN5P8iXi59AyuZy3Gy8I
 DMRdNZtmQY7S/48OWdpdxvz3U690Tu3t94Ct/siIWvl3T+NDqWTjVkcI8wd1vc6naZyv
 Z58Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/4sqLGoVYYd7FO8OAzwh0gi72+Kl/4/95A7m7t+U7i+cMWhk5GcUIa6RhP+tjyP/DqyWQS1q5G7A==@nongnu.org
X-Gm-Message-State: AOJu0YycgiFJwz64Bno1uv1ni+Cr6V3baWrtyoRXVBKVjqGUSrFIg0/c
 ohSf3SIf5pjun3PUaN3s4YcoZSlZ5neWVU080lyk0fM0GPmKcoA+jSOPau62S/j42AzdPFOYsQc
 Tk749YKaQpqixFMthcLjbvBVpe1s+ZJDCUSPxXKU5oojkfix4LxvKlQ==
X-Gm-Gg: AeBDietkEWukasQmuauYsWOj7LYjiIEKaO1sAuK8s8M4UjTXVhHdaYydH3wSp9+ulf8
 KH2Egt9I+fuwn79rttUUBke/DoeXv6FfN8XqmGLZ4jHitP8YKTk6HU39K7GDxGFOAKeVUSkGPJv
 bvAXlHMY3do1y+oNJeU3r2IaQ+dQ1F8QBfNDPbjRPxDTp/1uNkjNxhMR0r7Fe0RCxoJDVPFygRf
 cW36m1plHlvy50EV/+SmXB5NMF38rPYRhFjZ4qb+7zmGU4l5xPGZkoXLV38sWEZJs2bqQjsZwa0
 Za1t6HTkmqeXSZkrEq3iEJcDt8JslSXf6mLhgEp9x2MqenZxr0X6EXQTMCXZ2bDNY+XKnP7p2Lo
 TSgQmkUehB/qW+t9n9TNLVl0n5FXqgoRnVAu3tG0Bl0QQE1mC+EuEytLBvQ==
X-Received: by 2002:a05:6000:2902:b0:43d:77a8:3baa with SMTP id
 ffacd0b85a97d-43fe3dc551dmr5099588f8f.3.1776438650796; 
 Fri, 17 Apr 2026 08:10:50 -0700 (PDT)
X-Received: by 2002:a05:6000:2902:b0:43d:77a8:3baa with SMTP id
 ffacd0b85a97d-43fe3dc551dmr5099379f8f.3.1776438648677; 
 Fri, 17 Apr 2026 08:10:48 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4633bsm5228592f8f.26.2026.04.17.08.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:10:48 -0700 (PDT)
Date: Fri, 17 Apr 2026 11:10:44 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
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
Message-ID: <aeJNdLTRSZQiEiP_@x1.local>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-7-jamin_lin@aspeedtech.com>
 <3ee36a34-573e-48aa-91e3-9140244717f0@kaod.org>
MIME-Version: 1.0
In-Reply-To: <3ee36a34-573e-48aa-91e3-9140244717f0@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QaPeB5o4zUBKP0T7xgFSIAztVQ5V__MGQ9xK5nxNzsI_1776438651
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On Fri, Apr 17, 2026 at 09:01:34AM +0200, Cédric Le Goater wrote:
> + Peter, Fabiano,
> 
> On 4/16/26 03:49, Jamin Lin wrote:
> > Change internal EHCI descriptor addresses from uint32_t to uint64_t.
> > 
> > The following fields are updated:
> > - EHCIPacket::qtdaddr
> > - EHCIQueue::{qhaddr, qtdaddr}
> > - EHCIState::{a_fetch_addr, p_fetch_addr}
> > 
> > Update get_dwords() and put_dwords() to take 64-bit addresses and
> > propagate the type change through the descriptor traversal paths.
> > 
> > Adjust NLPTR_GET() to operate on 64-bit values:
> > 
> >      #define NLPTR_GET(x) ((x) & ~0x1fULL)
> > 
> > so that link pointer masking works correctly when descriptor
> > addresses exceed 32-bit space. The previous mask (0xffffffe0)
> > implicitly truncated addresses to 32 bits.
> > 
> > This patch does not change the on-wire descriptor layout yet.
> > It only removes the internal 32-bit address limit and prepares
> > for later patches that will add full 64-bit QH/qTD/iTD/siTD support.
> > 
> > Update the EHCI trace-events prototypes for QH, qTD, iTD, and siTD to
> > use uint64_t for the address argument and print it with PRIx64. This
> > ensures full 64-bit addresses are shown in trace output and improves
> > debugging of queue heads and transfer descriptors.
> > 
> > Migration compatibility:
> > 
> > The fetch address fields in EHCIState are extended from 32-bit to
> > 64-bit, requiring a VMState version bump (v2 -> v3).
> > 
> > Backward compatibility is preserved by keeping the legacy 32-bit
> > fields (a_fetch_addr_pre_v3, p_fetch_addr_pre_v3) for pre-v3
> > migration streams via VMSTATE_UINT32_TEST(), and introducing new
> > 64-bit fields for v3+.
> > 
> > In post_load, pre-v3 state is promoted to the 64-bit fields.
> 
> Since ehci is supported by downstream, I'd prefer that the
> migration maintainers also verify the implementation.

Thanks, I'll only look at the migration bits.

[...]

> > @@ -2441,6 +2445,11 @@ static int usb_ehci_post_load(void *opaque, int version_id)
> >           }
> >       }
> > +    if (version_id < 3) {
> > +        s->a_fetch_addr = s->a_fetch_addr_pre_v3;
> > +        s->p_fetch_addr = s->p_fetch_addr_pre_v3;
> > +    }
> > +
> >       return 0;
> >   }
> > @@ -2470,9 +2479,14 @@ static void usb_ehci_vm_state_change(void *opaque, bool running, RunState state)
> >       }
> >   }
> > +static bool ehci_core_is_before_version_3(void *opaque, int version_id)
> > +{
> > +    return version_id < 3;
> > +}
> > +
> >   const VMStateDescription vmstate_ehci = {
> >       .name        = "ehci-core",
> > -    .version_id  = 2,
> > +    .version_id  = 3,
> >       .minimum_version_id  = 1,
> >       .pre_save    = usb_ehci_pre_save,
> >       .post_load   = usb_ehci_post_load,
> > @@ -2501,8 +2515,12 @@ const VMStateDescription vmstate_ehci = {
> >           /* schedule state */
> >           VMSTATE_UINT32(astate, EHCIState),
> >           VMSTATE_UINT32(pstate, EHCIState),
> > -        VMSTATE_UINT32(a_fetch_addr, EHCIState),
> > -        VMSTATE_UINT32(p_fetch_addr, EHCIState),
> > +        VMSTATE_UINT32_TEST(a_fetch_addr_pre_v3, EHCIState,
> > +                            ehci_core_is_before_version_3),
> > +        VMSTATE_UINT32_TEST(p_fetch_addr_pre_v3, EHCIState,
> > +                            ehci_core_is_before_version_3),
> > +        VMSTATE_UINT64_V(a_fetch_addr, EHCIState, 3),
> > +        VMSTATE_UINT64_V(p_fetch_addr, EHCIState, 3),

TL;DR: I feel like we still need machine type compat properties.

Details:

When a v2 stream arrives, two _TEST()s will do the loading, then
post_load() extend it to 64bits, looks fine.

When a v3 stream arrives, two _TEST()s got skipped then latter two take
effect.  post_load() skips.  Looks fine.

When migrating to another QEMU, due to the fact saving vmstates always take
vmsd's version declared (3), I don't see how it can migrate back to a v2
stream; it didn't know about v3.

Jiamin, have you tested migrating from a new QEMU binary back to another
old one?  For upstream and serious devices, we need to guarantee
bi-directional migrations, back and forth.

Thanks,

> >           VMSTATE_END_OF_LIST()
> >       }
> >   };

-- 
Peter Xu


