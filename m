Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34E8CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 10:08:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE36a-0006CJ-0D; Wed, 29 Oct 2025 06:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vE36R-000692-FR
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 06:08:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vE36G-0004c9-R6
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 06:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761732491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AlAHYI3Q37iozbNQgfd3TyCrOZzmJ2h6bRZWdszOXs=;
 b=NqGEIZKuqsNhF/HdkDgwafJ3MQRaPjz3hTEWnRUh80JrGjiWbvxwgbs77b13e3vi/KLdh9
 Y4F6qND8CQybfHnZITyvJ2RI4nfvrjJtKeVDd0wKHdS9orBiezRmlqvb4MizMBOQZpwjUt
 hFdmTCTUWTJIfdLY62RoD/VPKgklJ4I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-bN3tBAcNOSWcZiAcEFNjcA-1; Wed, 29 Oct 2025 06:08:08 -0400
X-MC-Unique: bN3tBAcNOSWcZiAcEFNjcA-1
X-Mimecast-MFC-AGG-ID: bN3tBAcNOSWcZiAcEFNjcA_1761732487
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-475ddd57999so36327875e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 03:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761732487; x=1762337287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6AlAHYI3Q37iozbNQgfd3TyCrOZzmJ2h6bRZWdszOXs=;
 b=h7jWi0KxDM18ULc88VA0/XLraG0qBzREEfB3napfz8LT18X+ISs01b9ALZET/1NX2C
 jdwRlHlp5mY3QZcigKQEZ/yL88DltA8wmmy6KTzidVGEb+WmsjDkBiDaypxz3+j/yOv1
 IUItgzAsjdZmxShn3yT3qb9KiO2aHtCxGjfjTYv/+YJC5pnpWGpqeIYaD94SKsPY8/4P
 rRchIaNOzGjbrHAkuVlN+mnWfzZRYbycld4Ro/ofg9bHuhXFMMoMCJB2GEba/l/+Zb4D
 Id3pLHfZp/91PJD+trWyTnu5W+vE1EGVrpVuRBdYHJ8N6v74dSjCYFIwC7tcCDciDrID
 1Jog==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Doj6MIKSQy+8ArJyucupXI29ODFKCTfcp6qRUSnMCiIPHqwfo0nhR64PENFuMrRPuNeurLy1QQ==@nongnu.org
X-Gm-Message-State: AOJu0YwmBNoD9y33GJKmZfI0ZIwlVMeVrGupfx/6AANv+ee1gEJhUo1U
 BswuDorvPDxvUiIQo0bh1qvsq3wFzf634l9erglqiag2fhtgamUY17nirUl3WVucV3IJcW8L7Mz
 4QvtKIFVsMmxOWZCwEUa/9d65F57lRCgdCOgoReuVXdmyFH9s/MJreg==
X-Gm-Gg: ASbGncuKZkTPQlcIiwF21ydxLwPqyo4HyFgO+ZDcAYVmd0ZgEkkPKskEWGkk2VNGMUx
 B0iIhQn6FI5FaBSuo0Bse65UnMZX9KzcwGUL3IaH1SjC3US1Rep0W25+cf8nhyWpbFS+DQYIHaT
 Tu5E4VtHvYk19gXXsvKwrwXxANrdUzp6ds8rGahu2qXGvt0fQFI/gKO7V0CTLjqVCX+NILR8PmO
 PfAEDojBmLMArc8VT70VVGrDEqwsUtkZ/rZgp8GLTVQ4obqe1ArbIWHgzxd+6K5JB9y4/wgfx5G
 V3ea+Etv4CmNFpxdQx/r41x5SPGFJp4/x5as890drfwsDHYxVnUw7k6i6lJQiXwn5A==
X-Received: by 2002:a05:600c:4e90:b0:46f:b42e:ed87 with SMTP id
 5b1f17b1804b1-4771e20e3f5mr20262995e9.40.1761732487176; 
 Wed, 29 Oct 2025 03:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgrnupOSXqOCR3NSmEuuaYcK5eHUvG3WM+ycFSheDoi3gOzbJuD1arFHEXB6b1218sc/o1Ww==
X-Received: by 2002:a05:600c:4e90:b0:46f:b42e:ed87 with SMTP id
 5b1f17b1804b1-4771e20e3f5mr20262585e9.40.1761732486598; 
 Wed, 29 Oct 2025 03:08:06 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771902981esm39177935e9.9.2025.10.29.03.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 03:08:05 -0700 (PDT)
Date: Wed, 29 Oct 2025 11:08:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: salil.mehta@opnsrc.net, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, salil.mehta@huawei.com, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, gshan@redhat.com,
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 gustavo.romero@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 gankulkarni@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, wangzhou1@hisilicon.com, linuxarm@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com, devel@lists.libvirt.org
Subject: Re: [PATCH RFC V6 22/24] monitor,qdev: Introduce 'device_set' to
 change admin state of existing devices
Message-ID: <20251029110802.2ffa51e4@fedora>
In-Reply-To: <87v7k96cnz.fsf@pond.sub.org>
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
 <20251001010127.3092631-23-salil.mehta@opnsrc.net>
 <87plawh2sz.fsf@pond.sub.org> <20251009145125.6583a24a@fedora>
 <87wm54nmyt.fsf@pond.sub.org> <20251017165044.76b39f5c@fedora>
 <87v7k96cnz.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fGUiPSiBPIJiddI8jEZZuNcNdz_BDGCpDUEw0sd2gf4_1761732487
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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

On Mon, 20 Oct 2025 13:22:08 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Thu, 09 Oct 2025 16:55:54 +0200
> > Markus Armbruster <armbru@redhat.com> wrote:
> >  
> >> Igor Mammedov <imammedo@redhat.com> writes:  
> 
> [...]
> 
> >> > It's likely /me who to blame for asking to invent generic
> >> > device-set QMP command.
> >> > I see another application (beside ARM CPU power-on/off) for it,
> >> > PCI devices to simulate powering on/off them at runtime without
> >> > actually removing device.    
> >> 
> >> I prefer generic commands over collecting ad hoc single-purpose
> >> commands, too.  Getting the design right can be difficult.
> >>   
> >> > wrt command,
> >> > I'd use only 'id' with it to identify target device
> >> > (i.e. no template matching nor QMP path either).
> >> > To enforce rule, what user hasn't named explicitly by providing 'id'
> >> > isn't meant to be accessed/manged by user later on.     
> >> 
> >> Works well, except when we need to access / manage onboard devices.
> >> That's still an unsolved problem.
> >>   
> >> > potentially we can invent specialized power_set/get command as
> >> > an alternative if it makes design easier.
> >> > But then we would be spawning similar commands for other things,
> >> > where as device-set would cover it all. But then I might be
> >> > over-complicating things by suggesting a generic approach.     
> >> 
> >> Unclear.
> >> 
> >> I feel it's best to start the design process with ensvisaged uses.  Can
> >> you tell me a bit more about the uses you have in mind?  
> >
> > We have nic failover 'feature'
> >    https://www.qemu.org/docs/master/system/virtio-net-failover.html
> > to make it work we do abuse hotplug and that poses problem
> > during migration, since:
> >   - unplugging primary device releases resources (which might not be
> >     possible to claim back in case migration failure)  
> 
> Serious reliability issue with no work-around.
> 
> >   - it's similar on destination side, where attempt to hotplug
> >     primary might fail die to insufficient resources leaving guest
> >     on 'degraded' virtio-net link.  
> 
> Obvious work-around is failing the migration.  Same as we do when we
> can't create devices.
> 
> > Idea was that instead of hotplug we can power off primary device,
> > (it will still exist and keep resources), initiate migration,
> > and then on target do the same starting with primary fully realized
> > but powered of (and failing migration early if it can't claim resources,
> > safely resuming QEMU on source incl. primary link), and then guest
> > failover driver on destination would power primary on as part of
> > switching to primary link.  
> 
> I can see how power on / off makes more sense than hot plug / unplug.
> 
> > Above would require -device/device_add support for specifying device's
> > power state as minimum.  
> 
> The obvious way to control a device's power state with -device /
> device_add is a qdev property.  Easy enough.
> 
> Do we need to control a device's power state after it's created?  If I
> understand your use case correctly, the answer is yes.  -device /
> device_add can't do that.

Could you elaborate why why -device/device_add can't do that?


> 
> qom-set could, but friends don't let friends use it in production.
> 
> Any other prior art for controlling device state at run time via QMP?
> 
> [...]
> 


