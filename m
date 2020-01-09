Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2316446lff;
        Thu, 9 Jan 2020 08:08:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7jv3UPmNXK3+VXMtcpAqkt+P6M2Hoot/FgrVbGyNYGh0y2x+HuuSti1fVvDFBzxIcSBKE
X-Received: by 2002:a17:906:27d5:: with SMTP id k21mr11069926ejc.328.1578586100982;
        Thu, 09 Jan 2020 08:08:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578586100; cv=none;
        d=google.com; s=arc-20160816;
        b=S15VnPJEpETKF5Isxo2JRUwygaitjo7TEYhbSSrBZkLu7XnQyeORBS/3KogcYyWz2/
         8SvdtN1hMME+iKsCyNHkRXDKqqRh7H8HC8w8WrfHDIyNS+TUiuLEOYlz5ZcEvNqPyBym
         ZlLTx2aw4lKQr95+sefzIwfTmsNk/CwwacIwtOnF4ObGftzk9HF9ElIZ/ih/Yl5nNmYc
         VWxmz+4aV0jTxN563lqHCgRMRrVnBJNSp6ZlwkPzr9GOcOAf3NMG/gqRKrayK5fHpbPx
         36JPF0cLSy92lSFxlPeMkKqmKCUpmXsycVQVcxDOEhDU7YCJJKXfe+xW/MLNwjz1idXz
         1qKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9n3MIJ2DeLD98iErPP6o0avcoWZGXc9nCEUOvuizaxE=;
        b=X4fz/LVJakVEZ8JOEwPsuO0cc63oLHLehb7qfx1klnODJmaKYZDeg4khUsZDhQDmhu
         7wcgVoMUqZSSZliEKJQaKhyYtFbnhLzoPjiLrXdczBDJv9JohlrBCqmd1gc3gnhf10cf
         97i9dIoW/8jk/DRKws/K1CJFTc1fmCxR4KcsccSf0+owE6GtMNjUdKmuRknOgZ8opcrQ
         PVgHoYxamdys6OnMyQursiJ71lNodQhhkym60XPFYjHcAMIWjMsG0AH3otC+kg2i0LDF
         XTgeX5c2mpA9545VRjmqOIa3pDp8ut6eGiroPYgdlshfL/6Q3l1mdcrclj1Zq7AeLT+E
         D7Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J5P7Hc6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bf7si5210086edb.240.2020.01.09.08.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 08:08:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J5P7Hc6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipaM7-0002x2-T2
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 11:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51401)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipaLx-0002vJ-Tf
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 11:08:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipaLu-00051l-SA
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 11:08:08 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55582
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipaLu-0004vF-E1
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 11:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578586085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9n3MIJ2DeLD98iErPP6o0avcoWZGXc9nCEUOvuizaxE=;
 b=J5P7Hc6i0r3N4+Ielpo6pGzvL2mSSbYNeYsYXSF/Ef4urWPM15PhUO9VTLQkUjGLQDff/a
 DX59GmNnFDIj/tu1/U4wujikQBB2LfnRHRgGuSCbizA4hzLlHusXF9TF97CMAxlGgRxoV/
 CQ8JKKNG/2e68Im9DjGNITB6eVlGeO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-UbczhdzpO7SEBFja513NLQ-1; Thu, 09 Jan 2020 11:08:03 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19E6D19AD4E8;
 Thu,  9 Jan 2020 16:08:02 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B64D97C3E1;
 Thu,  9 Jan 2020 16:07:54 +0000 (UTC)
Subject: Re: [PATCH v12 00/13] VIRTIO-IOMMU device
To: qemu-devel@nongnu.org
References: <157858277631.10632.10417491075155237341@37313f22b938>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0701f56d-bcba-3c17-d894-f52254f06c2e@redhat.com>
Date: Thu, 9 Jan 2020 17:07:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <157858277631.10632.10417491075155237341@37313f22b938>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: UbczhdzpO7SEBFja513NLQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, dgilbert@redhat.com,
 peterx@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mbdpq9EFLih7

Hi,

On 1/9/20 4:12 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200109144319.15912-1-eric.auger@redhat.com/
> 
> 
> 
> Hi,
> 
> This series failed the docker-quick@centos7 build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> make docker-image-centos7 V=1 NETWORK=1
> time make docker-test-quick@centos7 SHOW_ENV=1 J=14 NETWORK=1
> === TEST SCRIPT END ===
> 
>   TEST    check-qtest-x86_64: tests/test-hmp
>   TEST    check-qtest-x86_64: tests/qos-test
> **
> ERROR:/tmp/qemu-test/src/tests/virtio-iommu-test.c:46:pci_config: assertion failed (probe_size == 0x200): (0x00000000 == 0x00000200)
> ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/virtio-iommu-test.c:46:pci_config: assertion failed (probe_size == 0x200): (0x00000000 == 0x00000200)

OK sorry that's because I eventually removed "virtio-iommu: Implement
probe request" patch from the sent series. I will remove that probe_size
field test on next round.

Thanks

Eric
> make: *** [check-qtest-x86_64] Error 1
> make: *** Waiting for unfinished jobs....
>   TEST    check-qtest-aarch64: tests/test-hmp
>   TEST    iotest-qcow2: 220
> ---
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['sudo', '-n', 'docker', 'run', '--label', 'com.qemu.instance.uuid=de2154161ccf4468af5ebd35cbcbdc03', '-u', '1003', '--security-opt', 'seccomp=unconfined', '--rm', '-e', 'TARGET_LIST=', '-e', 'EXTRA_CONFIGURE_OPTS=', '-e', 'V=', '-e', 'J=14', '-e', 'DEBUG=', '-e', 'SHOW_ENV=1', '-e', 'CCACHE_DIR=/var/tmp/ccache', '-v', '/home/patchew2/.cache/qemu-docker-ccache:/var/tmp/ccache:z', '-v', '/var/tmp/patchew-tester-tmp-_ap6ulch/src/docker-src.2020-01-09-10.01.05.32472:/var/tmp/qemu:z,ro', 'qemu:centos7', '/var/tmp/qemu/run', 'test-quick']' returned non-zero exit status 2.
> filter=--filter=label=com.qemu.instance.uuid=de2154161ccf4468af5ebd35cbcbdc03
> make[1]: *** [docker-run] Error 1
> make[1]: Leaving directory `/var/tmp/patchew-tester-tmp-_ap6ulch/src'
> make: *** [docker-run-test-quick@centos7] Error 2
> 
> real    11m50.898s
> user    0m8.023s
> 
> 
> The full log is available at
> http://patchew.org/logs/20200109144319.15912-1-eric.auger@redhat.com/testing.docker-quick@centos7/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 

