Received: by 10.28.4.212 with SMTP id 203csp5027090wme;
        Tue, 1 May 2018 09:06:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpzf4pajlg5YKHT6bz0dMHeg/tbUWgwoNVAuQOf53uKuclzrnfPDIqUT9lSm/DSIXY26OvW
X-Received: by 2002:a81:5791:: with SMTP id l139-v6mr4998729ywb.114.1525190793376;
        Tue, 01 May 2018 09:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525190793; cv=none;
        d=google.com; s=arc-20160816;
        b=gyMSCWztpgGURS6Um1Bc0Fnhg6nQAibsR7xLck06qB2MmAhIIgU3f7/klYnIU+EIhf
         mByKuWvPBs+sY/6Rpbh2NGqpfENgZUDRVsBPckR0FkAuXZMUUcBLsTD4WhBmP5KEhGIP
         aKKjLwgjokF+gfqos9HckvvX0+tKxVE/kBuI0ErPs8a2chACCaMu1552SnOiRvwe+15n
         77BCtk/dFAw2txzXRhS9OxBJMpg0HcLayIlvJYi6wGTnFd3mUfYYaWdincEXF9wxPAir
         KkhnAXE7RMT/XA31x6clcrx3WC14M/hNK3PDP5F8UUFDsvjZ9OFlJRRxL216YMkV9zZW
         3UqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :from:to:arc-authentication-results;
        bh=GkDcCipqzDnbdSkV7h0DpnH3Ok9H+ZZ/rWuJ88+TDE8=;
        b=PacITCtlzVLtxM4lJUVxIu8bqqV2Sjqua2prj/hDAZygC3Z0rGgpSaloHp0/3AOP/i
         P8tm5cEvwK4aeeZ3Sn85y0eDAJeYwGDZiIkbTTfXxnQ5ngnWnMSdh6OgU8iMj6wYMenj
         yqcoup0fLmI85XBm3ta0mcHF1u4uXiJfj+JWHMnHROp+DPgWSv0TRd4Ip4VWS1kWmBmB
         IMvElBMOSS9OJhfaQrGCDPqHvd2ZyiEdbjyuWAM5RcngXwe9GYhpuwiVcCcMyentYjam
         vEJegAdqw13SEmnKpXBxa07/LaJbPW/+06DeWCLwYuJx/8oWsMacoL7hgG+LPc9YbWHa
         zWwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n44si1421572uah.125.2018.05.01.09.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 09:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDXnU-0006Nu-Sw
	for alex.bennee@linaro.org; Tue, 01 May 2018 12:06:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fDXhM-0002I9-Rk
	for qemu-arm@nongnu.org; Tue, 01 May 2018 12:00:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fDXhI-0002gu-Vr
	for qemu-arm@nongnu.org; Tue, 01 May 2018 12:00:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45866 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fDXhI-0002g4-SA; Tue, 01 May 2018 12:00:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 518C4F8FF3;
	Tue,  1 May 2018 16:00:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47108111AF28;
	Tue,  1 May 2018 15:59:57 +0000 (UTC)
To: qemu list <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f41972e8-0ae2-7c1d-a66a-499a841080e3@redhat.com>
Date: Tue, 1 May 2018 17:59:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 01 May 2018 16:00:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 01 May 2018 16:00:04 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] Expand ECAM region in machvirt 2_13?
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6hi4kjT+Etjc

Hi,

I would like to resume the discussion on extending the number of PCI
buses to 256 (as in Q35) as a follow-up of past discussions:
https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg03631.html.

With the current 16MB ECAM region we are limited to 16 PCIe busses.

Could we envision to have a 256MB ECAM region and move it to another
location beyond 256GB, in virt2_13 machine type?

Current ECAM range within [0x3f000000, 0x40000000]
would be kept unchanged for legacy and when vms->highmem is set to false.
Migration from <2_13 to >=2_13 would be allowed whereas migration from
> =2.13 to <2.13 wouldn't.

Thanks

Eric
