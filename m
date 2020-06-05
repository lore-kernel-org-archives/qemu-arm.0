Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2557174lfc;
        Fri, 5 Jun 2020 08:31:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVNhaMcExZuoSf9GoynIDYdxsDj4YRcnbJ3XPbntl4px4LRs8mbCnypdKeuIAiZ1ejtEP2
X-Received: by 2002:a25:d689:: with SMTP id n131mr13675243ybg.523.1591371112814;
        Fri, 05 Jun 2020 08:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591371112; cv=none;
        d=google.com; s=arc-20160816;
        b=uqKwhdXorl+UWZlY9BQvdFfYKJW04Vz6qP+vXT7pvhd9/ZZ4siPSl203v8uZZz15W8
         EnVit56hjbci5hN0FPUYexIplVjxfjNja/voE6CGDDFk/mpmcam87OiHZTeMphH8AsrO
         B/HWDJShyYh1z0cft5bJrnji1ZolqCuZjiF5iUzcSm3VbqsVj4vvNOgiykYdZGd2teGZ
         X3rAXU3FLD2TMhHXeyA4S6jYQk8JgXHJM2OjRP8Y1SVNPdmQSHA8KGhIQkbGRFtinPk+
         eUpfMEIj+ICVzoMDU653sYppjoRS7KoOxEp9B5uMHBSvPhODHqop3q15GUQ+OBQXyHrP
         gnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=Y1sRs9l4mfzUIv/oGqK1YEdkP4d50sNVxztR4XH8JfQ=;
        b=Q6Qes9h+T1s3gdcLkr84tO6P/EUxJY2yO8OFelOYcsmwHCjXdoySzTBhn44JBf2Glf
         EeXAztm1u8CDcyYtGsdwc+8VgciW35YMW3sYP4/ewU6sdPob3ggIVlTzu3Uy3Ncz3ZZJ
         uTW5bLQSZDOM2YxSDZzUHZdfQK7mWjwO8FlfbSIYMK1MqDDC3D2HOQpijBnl23wvB+cl
         1UomgjFyxexZlcJEZJGHEjY4VrEcjeVJcscM3ZXD7KD8rZZvQr2sPItUJg80xz1FpSvE
         TlHqW99D/rOHF6CiTV3gcTDiE3xDiOpYQcFWvfKbwmyAWQTzL1iqGrEnHdp/krT28Tuu
         74ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="B/4TULMV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p190si7434010ybg.434.2020.06.05.08.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 08:31:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="B/4TULMV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhEK0-0006pG-19
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 11:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhEJb-0006nQ-WA
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 11:31:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51378
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhEJb-0007vl-8K
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 11:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591371086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1sRs9l4mfzUIv/oGqK1YEdkP4d50sNVxztR4XH8JfQ=;
 b=B/4TULMVTz1NFP0geNfwroHnaal9rwN3e6b2OCi6Pjma8jqpQ8zp6o8THQKUjWX/8ISDg3
 QTx9q+uvgTfbPRpZjG/gk503IaridPuD/2S+plJ8L4tRffWVqmXshyX4zDmFlfDrNJnedD
 R+g7NBUu/YqsWAloxhFuxDyZ6DV+7/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-zFUEQ4yBNvm71JWWwCKRSw-1; Fri, 05 Jun 2020 11:31:24 -0400
X-MC-Unique: zFUEQ4yBNvm71JWWwCKRSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7524C107B76B;
 Fri,  5 Jun 2020 15:31:23 +0000 (UTC)
Received: from localhost (unknown [10.40.208.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEA2810013C0;
 Fri,  5 Jun 2020 15:31:18 +0000 (UTC)
Date: Fri, 5 Jun 2020 17:31:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Message-ID: <20200605173116.55419a1e@redhat.com>
In-Reply-To: <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
 <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:40:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Salil Mehta <salil.mehta@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QoC6GD6Pi1Mt

On Wed, 3 Jun 2020 11:37:45 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Mon, Jun 01, 2020 at 03:04:33PM +0000, Salil Mehta wrote:
> > Hello,
> > I could see below within function fdt_add_pmu_nodes() part of
> > hw/arm/virt.c during virt machine initialization time:
...
> 
> > Q4. This function  fdt_* looks to be wrongly named. The info
> >     being initialized here shall be used even when ACPI is
> >     being used. Initialization part and FDT info looked
> >     mixed up here if I am right?  
> 
> Agreed. The function has the wrong name. mach-virt has many functions that
> mix the initialization and fdt building together, but those functions are
> named something like create_foo(). Patches welcome.
that was where I gave up on cpu hotplug arm/virt the last time.

Ideally we should split out from create_foo() all firmware generation code
(fdt) and move it to virt_machine_done time + make sure that it could be
regenerated at reset time so guest would get updated FDT on reset.

> 
> Thanks,
> drew

