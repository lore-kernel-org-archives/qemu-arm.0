Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp403882lfq;
        Thu, 14 Jan 2021 08:04:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygzmvhIWOPgva62pIhMoqhbMVJL7ALWGW/W188p6ugFq/v/HdY/S7Dc3hEXlt5Qzhm2pCJ
X-Received: by 2002:a25:738d:: with SMTP id o135mr11356015ybc.233.1610640285705;
        Thu, 14 Jan 2021 08:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610640285; cv=none;
        d=google.com; s=arc-20160816;
        b=jMKaGET3U497JNxNvItZUkU/ltWEO8FWmeyiDtXuCOL4dWoCcdLl9l6ybeGZs85xq+
         /yBKvcm6j6liLYf/4qPEMuTRQLYJe3zLjz2sHqh/8BBF9LIZyhC8WWAsRPRpv1nVEW7l
         eU5StUEUNHlsA9nVF2B5cmNbHCII8RMJF9Lqh7tJIcF/4tk2Q+rzT+5qoWjJUh5TMODL
         NnQ2ov0X4cebXcp111X9iORu6wgAkhuNKCUdrDVFu/ESCrOX5tuxOsxBwPcwbIk99tta
         ceEI9KND181E+RxoWRw+yULPwlciek9OxqxXyHzYUNf19960wwfnMUnEL8A0xC6KV5RD
         oKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=ZLCvurpnBG5U2vJ3uC0YnZuSpg2DuU2aBar4wPu5hl8=;
        b=eKPJg8ypSMynMThsXSZxvoTgpuuQ+IZiXatjiVes43mNwQI48Dij3VeNRGEJ1TpXAi
         8Ylb/S4Fq2+PMl/BMEydGBZk+LdlvmWSRo8Nznk+fAgTbJq4J9nscu28BzA4ej70qeS9
         kV8StF9hN6A/6tMrL3secYScgALXiFiFS8B+hn4mMyr4gk6QDSooPgsWb5eOWAg7XnPm
         aewXC4gAw5SL90Iurq+x/DmXjQOq0ZNCogNJIG4kN2x2dz7E/d6oGDn7MK6533a8OKkp
         eW2x9YOiqe0C+01VYww+/HVpxeHmdYZtdiq/v3mRPedZeDpHOKYXinvtMyytkXtg+CXo
         GyaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aOHZomde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z133si5722786ybz.330.2021.01.14.08.04.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 08:04:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aOHZomde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0576-0003sM-Lr
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 11:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l056I-0003r7-IC
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 11:03:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l056F-0002ew-CO
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 11:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610640226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLCvurpnBG5U2vJ3uC0YnZuSpg2DuU2aBar4wPu5hl8=;
 b=aOHZomdeSM1ra+seMg1gpWNIacpkwQx0DFBrHMtIZD7MF+YI7L4i6j0CjfvVriypaTAjIv
 Yu4LRKToAUH5fNxpEB8v0coH7xLBVCEBQ1vh32+V7nJs7sCR2NQVV3zd76AlJnd3Z6weuY
 O3cafQt4TSNORnLcVI7IwlOMxEhUxmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-ViwbLcTkPxqfjLd_vJJRNQ-1; Thu, 14 Jan 2021 11:03:42 -0500
X-MC-Unique: ViwbLcTkPxqfjLd_vJJRNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00C74EC1A5;
 Thu, 14 Jan 2021 16:03:41 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-112-154.rdu2.redhat.com
 [10.10.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C98A0100AE40;
 Thu, 14 Jan 2021 16:03:38 +0000 (UTC)
Date: Thu, 14 Jan 2021 11:03:35 -0500
From: Andrew Jones <drjones@redhat.com>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: Re: [PATCHv6 0/3] arm-virt: add secure pl061 for reset/power down
Message-ID: <20210114160335.hvqdh7mqmm3vff52@kamzik.brq.redhat.com>
References: <20210114145032.8457-1-maxim.uvarov@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210114145032.8457-1-maxim.uvarov@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Jose.Marinho@arm.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, tf-a@lists.trustedfirmware.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CgPoVU9NY+qV

On Thu, Jan 14, 2021 at 05:50:29PM +0300, Maxim Uvarov wrote:
>  v6: - 64k align gpio memory region (Andrew Jones)
>      - adjusted memory region to map this address in the corresponding atf patch
>  v5: - removed vms flag, added fdt  (Andrew Jones)
>      - added patch3 to combine secure and non secure pl061. It has to be

I think you should do non-functional change refactoring in patch 2 and
then add the device with the DTB updates in patch 3.

Thanks,
drew


>        more easy to review if this changes are in the separate patch.
>  v4: rework patches accodring to Peter Maydells comments:
> 	- split patches on gpio-pwr driver and arm-virt integration.
> 	- start secure gpio only from virt-6.0.
> 	- rework qemu interface for gpio-pwr to use 2 named gpio.
> 	- put secure gpio to secure name space.
>  v3: added missed include qemu/log.h for qemu_log(.. 
>  v2: replace printf with qemu_log (Philippe Mathieu-Daudé)
> 
> This patch works together with ATF patch:
> 	https://github.com/muvarov/arm-trusted-firmware/commit/7556d07e87f755c602cd9d90359341bdd14d9d57
> 
> Previus discussion for reboot issue was here:
>      https://www.mail-archive.com/qemu-devel@nongnu.org/msg757705.html
> 
> Maxim Uvarov (3):
>   hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
>   arm-virt: add secure pl061 for reset/power down
>   arm-virt: combine code for secure and non secure pl061
> 
>  hw/arm/Kconfig        |   1 +
>  hw/arm/virt.c         | 118 +++++++++++++++++++++++++++++++++++-------
>  hw/gpio/Kconfig       |   3 ++
>  hw/gpio/gpio_pwr.c    |  70 +++++++++++++++++++++++++
>  hw/gpio/meson.build   |   1 +
>  include/hw/arm/virt.h |   2 +
>  6 files changed, 175 insertions(+), 20 deletions(-)
>  create mode 100644 hw/gpio/gpio_pwr.c
> 
> -- 
> 2.17.1
> 

