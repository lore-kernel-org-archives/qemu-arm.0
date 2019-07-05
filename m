Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3270407wru;
        Fri, 5 Jul 2019 08:10:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwA4wymKGxt/JQ+jgPf9vVKvn/KwBIIzWnuePX9bGFNH7tgTiHt+YB8CsuGLjRO56atYTp7
X-Received: by 2002:a50:ae8c:: with SMTP id e12mr5189161edd.8.1562339401484;
        Fri, 05 Jul 2019 08:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562339401; cv=none;
        d=google.com; s=arc-20160816;
        b=KBv0Su9+AjGjWkPaqTH59PemJiDUUzEFjeEVID31HAL5HULFoindh2VwHm0FCy9UUk
         IbtdnXSKOtCbv62g4koqSWMPq4Vi1b8cBWUXtGMcv/0H0KbtuQGxAfI0E2K+7gepLunL
         oVlBI10qD5zPmar3dxpfAeqVzMHZ/Sa+Zo43EVBRKY8fR/A/bHp2uVuFlEwzQjQqdytJ
         pvNqv5784wy02EeQYY17kdOLT20PCKzScOhYYz5RoJ1cOXXmnkwFsXNDQmCxF+sXf2oG
         8RLQEQtd1Mi5BSz8hgQYMBAVYx5y0/YR/BP1+/ok8hupbjjFMzHfeHsaODPRke9YqzDD
         nP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fS1XqJWqVjRHcta7KHWeyMOfnXXwi8tdMareZxThb2I=;
        b=Ao/pEATnjSMpf5RsSQnZPs9xA9Dkd5tWplGvuXKoJzvWimPq5Y2OYAcnDODVKX2xyo
         2i1uP3DMaC5jiLwBygK+B9BSvEZ4gr7fP8pgFU7eaMqFX4tuj2hDeBHRDqAj/UPxXg99
         S9W12sP9h8X+/gj9nPHhkHPUrYqQJzvYmLAje7Py/Ba8seboUJAOriLT8KDDPSchat3M
         oMby1dkaSO5y0bskhDch6csroY2VL6LVIfHqzf2QHXZqOvW0Z8sjI7bhIU6Q22LRmx3P
         hUbCHyr+XUeG5QV+PmzyEe5/iqIjwMM1A8xxMAEY89eAMlanqi40fPb1fODrk/xhLhzq
         YNXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G2eYhLPg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m32si7200716edm.415.2019.07.05.08.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 08:10:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G2eYhLPg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjPqW-0001WU-LF
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 11:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57261)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <zhangfei.gao@gmail.com>) id 1hjPne-0000Mn-HV
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhangfei.gao@gmail.com>) id 1hjPnb-0007EN-Jj
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:06:57 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:44354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <zhangfei.gao@gmail.com>)
 id 1hjPnW-0006La-Ix; Fri, 05 Jul 2019 11:06:50 -0400
Received: by mail-io1-xd31.google.com with SMTP id s7so19728402iob.11;
 Fri, 05 Jul 2019 08:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fS1XqJWqVjRHcta7KHWeyMOfnXXwi8tdMareZxThb2I=;
 b=G2eYhLPgxZ8gGuHfFBPNItxk3ckhVoGlJ51smvVYmMlSctLNv8md9m9/faVpp+3sWn
 G7dsjXrcvnbGqyokCPTI8G56y2jSPwPfbx6JhsKmugaAoFu8u7Mo6+z0Ug+eBiChuQSE
 StatRFk+eVzxi5ZwobOVJJqNPnYRJvZeyY0dZaMx+gaW7QhAmaaQsT1jPH991/6cFysu
 qRazaxALmdsc9CBB4ZoYzmKAk0NahRxa3vJufbrt590956SITCDn3/vksom3z/LmHa8M
 vZRgQ3d8UVEVNo+B+E2NYBPRmiJX4LiMthNPfDQs8KfllIojx09iMLJ798jRIMydvmCY
 U8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fS1XqJWqVjRHcta7KHWeyMOfnXXwi8tdMareZxThb2I=;
 b=WGToXfCV4WrEvJ0IQHc3hcFF1GkeIEvCV0fzydsZ8WPdyKCN2ecv4QTzPX6R1y0uBP
 s3hzRM4cUQF0KEM/pFxfOcLK/mqjnOS//ti0g9gPaPN/O/Eg4tQE7803C42r1Uh6v9HA
 jqhVVe4ShK40FTIpdtfi2Zw9wAGTeCFHlMPMNQzwlly2aP4CjRyMpWpdoiXskDmyLH50
 7yhF07/R8FRRnxAsx4ehaCbqCqKhnzU1Evqy6D+sK/5zbXONgGfx5BL1zmxbOi5dx9gZ
 9MlRVg5vf0CzYjV4fVSDTjIf+gN681qwD7VpTd4gBxptOP8ffgOqd853OqAgVgEBzZ4C
 42Ig==
X-Gm-Message-State: APjAAAUtn4t732ZF+7lZP5v7wJuBbW6dJ2KyIeeFil2IHn2WwHy7MUyR
 y2jjM8sqYfuF7qeK5W6iw/gtlIEAVhO8RvgzphM=
X-Received: by 2002:a5e:c207:: with SMTP id v7mr4795904iop.163.1562339202985; 
 Fri, 05 Jul 2019 08:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20181122171538.12359-1-eric.auger@redhat.com>
 <VI1PR04MB48456BBF709F364C8E9B08269AD00@VI1PR04MB4845.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB48456BBF709F364C8E9B08269AD00@VI1PR04MB4845.eurprd04.prod.outlook.com>
From: Zhangfei Gao <zhangfei.gao@gmail.com>
Date: Fri, 5 Jul 2019 23:06:31 +0800
Message-ID: <CAMj5BkhwpP0GMkZ2Cp2aQBAQvNzZYZuTz_4wzwGKhW4F_5OQcw@mail.gmail.com>
To: Bharat Bhushan <bharat.bhushan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d31
Subject: Re: [Qemu-devel] [RFC v9 00/17] VIRTIO-IOMMU device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>,
 "tn@semihalf.com" <tn@semihalf.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tFYjClZrlXso

Hi, Bharat

On Tue, Nov 27, 2018 at 3:12 PM Bharat Bhushan <bharat.bhushan@nxp.com> wrote:

> > Testing:
> > - tested with guest using virtio-net-pci
> >   (,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on)
> >   and virtio-blk-pci
> > - VFIO/VHOST integration is not part of this series
> > - When using the virtio-blk-pci, some EDK2 FW versions feature
> >   unmapped transactions and in that case the guest fails to boot.
>
> I have tested this series with virtio and VFIO both
> Tested-by: Bharat Bhushan <bharat.bhushan@nxp.com>
>

Would you mind pasting the qemu test command.
A bit confused about testing vfio, virtio-iommu-pci has no "host" property.
Do we need unbind pf and bind the device to vfio-pci first,

Thanks
