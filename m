Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp558187lfc;
        Wed, 3 Jun 2020 07:37:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFLrfXQRly6yTLXLaddMprAsQqdCsmwpuG/nG0EDXc0CyTF1ySVXrW3A/X4+ZCy8sgMPSB
X-Received: by 2002:a25:6b4d:: with SMTP id o13mr347932ybm.496.1591195042677;
        Wed, 03 Jun 2020 07:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591195042; cv=none;
        d=google.com; s=arc-20160816;
        b=bMZGyad0bJXRpbKL+EDOK/t9l/yYNSDICeYLz7xr2EeeHNGcRA9Qdo9/jVyKxeuXBD
         GQZTrLYI9rUdHy9zfSzBd+jhr25eME6uy9+A2CW49uif5HDxsZZYFS6naRbnbBcKG0r+
         Vg9d+Am6t6xhaL0syrZnzujj+usLLJ8xBQYj+WNbvOwFl9hWC6/f372Peg7ZxKIY1q5D
         TNexA+iLeJEg7L6gt6MkzykP0A4pRYb05vSePQC1TG2yDBxir/Z6k1Dtou9oLldLLupV
         e/MXxKngi7Mnmhu6MSy7MlQvwSm3N2UESJBRow60+FXQmtQmxzf27Xx2FqNRwQCztFfz
         gmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=in+iVOeae4238+8fFUNG243pHygH5dj3ilrd4Gbh8OY=;
        b=H0o/ZsHVME4rDrrv75JHKrJoyX7yKB6eBMvohBvfOwfInwVMPiFNWrndedjpnph8g3
         1bcVYkQZgbRCmiuPsYL3pstrEUMLi4VLrfHOE9nTm4Ia/nx1t4UeZuDq4V/oGoCeL5ij
         nGdEc25BUGHQNkhfmVct+TRF6Yc+C2tP3iE6Be4etegSsZW4vBkaIwOMKKee4j8nuAj5
         vGHUFlnd2HpsrrpqTFSbdgOIeiHep9PWjGFCMecQHJik9TpGsNP8oC55Sj664z/tc0fI
         27OqZPzoZXe6Ec2bBG9YAfsq8SNon3JgGtFiuqF3yYxhRXri01aIc/y1VHLBgNXjlsBB
         2Tpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dr5BOziZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si1725036ybd.465.2020.06.03.07.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 07:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dr5BOziZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgUW9-0008SE-M5
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 10:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgUVz-0008QV-P0
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 10:37:11 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34063
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgUVz-0005o7-5H
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 10:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591195029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=in+iVOeae4238+8fFUNG243pHygH5dj3ilrd4Gbh8OY=;
 b=dr5BOziZCmRhpUMKQC9F0MhX+f89mNbuE4IDffHQ9B6uHZpfpIuAlVx4G97aiumi92WLA0
 QotH4m51k8rbTopdAPWFsyKMd1otuDDnq7ITJAHheZj6wlDEEuxC/8d1z9g89RmqlUSmdy
 o0kNSk71291QjqZROIbDGrGfZVrMyks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-VrywZ4wQMTelj-qFLGGKVQ-1; Wed, 03 Jun 2020 10:37:08 -0400
X-MC-Unique: VrywZ4wQMTelj-qFLGGKVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6CA7107ACF3;
 Wed,  3 Jun 2020 14:37:06 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.196.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2A6119C71;
 Wed,  3 Jun 2020 14:36:58 +0000 (UTC)
Date: Wed, 3 Jun 2020 16:36:55 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Message-ID: <20200603143655.vk3uqw5lvgv6sm5p@kamzik.brq.redhat.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
 <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
 <6bacdd359e504ed8924e67ed125bf15d@huawei.com>
 <20200603121606.bj3mjlqsstzbu7py@kamzik.brq.redhat.com>
 <5cb329f13566411eadfeca7c9a1b4bf5@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5cb329f13566411eadfeca7c9a1b4bf5@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YJOibtz2Ijeh

On Wed, Jun 03, 2020 at 01:48:10PM +0000, Salil Mehta wrote:
> (Maybe I should float the ARM VCPU Hotplug patches and let this
>  discussion be held over there?)
>

Yes, I think that would be best. Keep in mind that the 'pmu' CPU property
is just one CPU property that we require all CPUs to have, if any have it.
'aarch64' and 'sve' are two other examples. And, likely any CPU feature
that comes down the line that we want to use with KVM will fit that
pattern. I think the hotplug patch series will need to handle those
features in some way other than to push them all into machine properties.

Thanks,
drew

