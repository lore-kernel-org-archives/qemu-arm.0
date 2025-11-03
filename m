Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027A9CCF9FE
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 08:28:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFpv7-0004t7-7j; Mon, 03 Nov 2025 03:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vFpv5-0004k9-AS
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 03:28:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vFpv2-00075i-GJ
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 03:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762158480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TvA/uPk3vEFJyp4WZkt2yirW+qM5sCLKrp5p0enga4=;
 b=Xd4QWl0Egm2GkOi8lbSL+VGDPqfngG/QlBF1YelY5Y8ypYX5cr5bR+0I1+GR30FToUM5RY
 SwzNeJG1ARIzCtNY1Pd5IJMWtdwxdhAaqqq7P7wdd8/g8KfsT8hBYjpYsbavTGmA6P+YB8
 dYS/xA/ak659VdgGa2aVXg/BbG2pahY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-83mQoYVFPnWJ199lKWA1cg-1; Mon, 03 Nov 2025 03:27:59 -0500
X-MC-Unique: 83mQoYVFPnWJ199lKWA1cg-1
X-Mimecast-MFC-AGG-ID: 83mQoYVFPnWJ199lKWA1cg_1762158478
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4710d174c31so44848935e9.0
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 00:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762158478; x=1762763278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0TvA/uPk3vEFJyp4WZkt2yirW+qM5sCLKrp5p0enga4=;
 b=rw6FtjTgWTC14UvLiosA2Rh2QHPxsNvdVMlVO6ZDdAiM6/KXWhi8QQyCWgvndBxaV5
 j16Mg5AsyPnBWkwNQKc2YD1S452uQ23uWdJHDJZrFejILnm/u9TpNcTXp1YAJGgeG3zi
 Cfxt6WyLw7AWJHdshPbag2cU+1AdMxVKEhMCLnYBTnv17hCyirOq5PaLQfECPb2NppFz
 TNisFkCJyDqMxaZaH/L7pXjTmUBlYCvhyWsjiewA937krpoip3FOoXENTUwUVdIYQA6d
 K94UdTzdTSGtPKLHhQNMbQd5U9zNCgbot6A8/4CtPQs/31/ZJY8XnFPh2jwrc5x37VFx
 tnjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOs5CB4oDBGYfsZ+wYO06+uJ4Ke73lSnGF+17VguG1xeSyuqA1eQHo+Ut6WnL/asvtuPixBYkpAA==@nongnu.org
X-Gm-Message-State: AOJu0Ywm3udmTkgdPFJAIuvnDKVVguawVwT+6glFa7ImKwqaHpyy/MPB
 ZUb/RWTZyBJ8DmUTsbLUugWdgp6S/q2uGjBIEW3M2VUdNV8/oFJOtHsnRuLArby1OMoj6SqXGjJ
 q13ZZ1eGXhTc4IEXhG7j7yPZv6oLiykK5GFteQyTUzQzTkDSyOBg/6Q==
X-Gm-Gg: ASbGnctfIFUVnJWk4jiMv3AZBnzNLMsIyfkMWerdrwsKXjAu0uKQ4PN2pfha4fXl6NT
 3AwvxTaQj2ObiD/whnln8irg1IfrXSZ5VlHKD2cBtyTOA90yFnFR/iOxKADHC4T59rlVL9oXh0I
 5F3ogQ9b+Z8OC7U8RC0cm/AzkpfP4FbHj1+l/dbiIJQUPOtWIjr4RYQyfLw1EPJ/xxUw3qzUEfS
 r5H3+dHBkeNThQLkExLTkDRaIDXLIPIpfPCfHoeVxFDNpeQermY5gIWQQvfF10NMVO5Wue+ZtvG
 YgeWp8/LgJd8graWgIhK6LNqiu1Pz4Lff58zrj/z8lXrsIE/qfCRpDwv1SPpgfbuwA==
X-Received: by 2002:a05:600c:609b:b0:475:d8ef:64e4 with SMTP id
 5b1f17b1804b1-477308b60f5mr103336605e9.39.1762158478051; 
 Mon, 03 Nov 2025 00:27:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHThjylrSLgTOmkW+tT9OADvb4u9QJUwZYoVCpQN0I6fdBmwFK65t6uNFzNVphVFi9wri5Ohg==
X-Received: by 2002:a05:600c:609b:b0:475:d8ef:64e4 with SMTP id
 5b1f17b1804b1-477308b60f5mr103336315e9.39.1762158477569; 
 Mon, 03 Nov 2025 00:27:57 -0800 (PST)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47751794620sm9264565e9.6.2025.11.03.00.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 00:27:56 -0800 (PST)
Date: Mon, 3 Nov 2025 09:27:54 +0100
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
Message-ID: <20251103092754.6dda4aa0@fedora>
In-Reply-To: <878qguos4l.fsf@pond.sub.org>
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
 <20251001010127.3092631-23-salil.mehta@opnsrc.net>
 <87plawh2sz.fsf@pond.sub.org> <20251009145125.6583a24a@fedora>
 <87wm54nmyt.fsf@pond.sub.org> <20251017165044.76b39f5c@fedora>
 <87v7k96cnz.fsf@pond.sub.org> <20251029110802.2ffa51e4@fedora>
 <878qguos4l.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kPuTFUrDC7ipzUK9sKRrG5LF5ozGE5F48hs4AKBQdV8_1762158478
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Wed, 29 Oct 2025 12:38:02 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Mon, 20 Oct 2025 13:22:08 +0200
> > Markus Armbruster <armbru@redhat.com> wrote:
> >  
> >> Igor Mammedov <imammedo@redhat.com> writes:
> >>   
> >> > On Thu, 09 Oct 2025 16:55:54 +0200
> >> > Markus Armbruster <armbru@redhat.com> wrote:  
> 
> [...]
> 
> >> >> I feel it's best to start the design process with ensvisaged uses.  Can
> >> >> you tell me a bit more about the uses you have in mind?    
> >> >
> >> > We have nic failover 'feature'
> >> >    https://www.qemu.org/docs/master/system/virtio-net-failover.html
> >> > to make it work we do abuse hotplug and that poses problem
> >> > during migration, since:
> >> >   - unplugging primary device releases resources (which might not be
> >> >     possible to claim back in case migration failure)    
> >> 
> >> Serious reliability issue with no work-around.
> >>   
> >> >   - it's similar on destination side, where attempt to hotplug
> >> >     primary might fail die to insufficient resources leaving guest
> >> >     on 'degraded' virtio-net link.    
> >> 
> >> Obvious work-around is failing the migration.  Same as we do when we
> >> can't create devices.
> >>   
> >> > Idea was that instead of hotplug we can power off primary device,
> >> > (it will still exist and keep resources), initiate migration,
> >> > and then on target do the same starting with primary fully realized
> >> > but powered of (and failing migration early if it can't claim resources,
> >> > safely resuming QEMU on source incl. primary link), and then guest
> >> > failover driver on destination would power primary on as part of
> >> > switching to primary link.    
> >> 
> >> I can see how power on / off makes more sense than hot plug / unplug.
> >>   
> >> > Above would require -device/device_add support for specifying device's
> >> > power state as minimum.    
> >> 
> >> The obvious way to control a device's power state with -device /
> >> device_add is a qdev property.  Easy enough.
> >> 
> >> Do we need to control a device's power state after it's created?  If I
> >> understand your use case correctly, the answer is yes.  -device /
> >> device_add can't do that.  
> >
> > Could you elaborate why why -device/device_add can't do that?  
> 
> -device / device_add create, configure, and realize a new device.
> 
> They can't reconfigure an existing device.  In particular, they can't be
> used to control an existing device's power state.

Sorry, I've misread as we can't use both for creating device in powered off state.

Perhaps we should consider a new specialized QMP command to
manipulate runtime power state. (Like it was suggested by Daniel) 

> 
> >> qom-set could, but friends don't let friends use it in production.
> >> 
> >> Any other prior art for controlling device state at run time via QMP?
> >> 
> >> [...]  
> 


