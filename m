Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4310400wru;
        Tue, 7 Aug 2018 08:07:32 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf6nAw0aZe/vNMi0GNf9tf2U+4TYruVNrt1M0mDRRP93rbGLGSk7dgsPXkCRBZrW+gugsjU
X-Received: by 2002:a37:5f87:: with SMTP id t129-v6mr18618336qkb.23.1533654452847;
        Tue, 07 Aug 2018 08:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533654452; cv=none;
        d=google.com; s=arc-20160816;
        b=iRYEzg4hqyAt6DRfAiWwjoqDpJuetXWzDgVnHcnDhiZ7Te8Xa9GQKoZK5YZITKYUOb
         CGSdzI3tsNR3zr+fQa/wzz2BhN+YB/m9FZTAiYdNd6Qj2bty9a7fTg/fIp1YEzlZ6dXS
         OPtg/pQaBx/wjOEMWI81cX/0pUtA3wbCkQhb1h+iuPO8Dt2aDAtxlXHB+upQVxS8W8SD
         28SW0W1aBuuN/92veQ6+wra2CUOJizeY9WlrkpuEtgUBwjhsaXV7G4AmsnmH54fAq77W
         OY/7SO919klZ/9CLur4U7/L9GXpOXYCCEUKCOz7e7h+cojjryCg4bSiFHz2Pv9NO/dYy
         NASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=w0hAXnPCjaOwKkuStv6Xgcdynx38gM/La+1xn7lufRw=;
        b=u9Qpxm8ScL0fBgRPNUbimknBZUTUC57RTK6xK4NstMiHsnNybDte6ZEPJ/pIzyAFzN
         27+/aO+KVdLviGyFtVwSwX3/eKHOpF22v7RMmV2TnbwqYaS8rNE1paLhqA5ckxMjN1lL
         1s0qjbP4MIslSCF0RLJuMcj/QUPDFl+UCAEHA3ow5D0pMCCyJDzm6onPOzWtSTIxy0ZV
         dMSR9h4Q0oFqXdALC6uR4oYQiH45mOFwdIAuwIeI1ujujch6PLIp1TViVaiMjZlZjbRJ
         sKcPc96aykIYw7hLiYlNHt4vnJGzTM2vkK90BHtz+ZG3a1QRkyh9hnfMK638XVqJVlaC
         Icow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n51-v6si1317718qvn.276.2018.08.07.08.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 08:07:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn3a8-0007Zi-AJ
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 11:07:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn3Yg-0006fs-R9
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 11:06:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn3Yc-0002bY-PK
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 11:06:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36762 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fn3Yc-0002bK-Fv; Tue, 07 Aug 2018 11:05:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AADC97DAC3;
	Tue,  7 Aug 2018 15:05:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9484E2166BA0;
	Tue,  7 Aug 2018 15:05:55 +0000 (UTC)
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20180725143413.9728-1-geert+renesas@glider.be>
	<20180725143413.9728-2-geert+renesas@glider.be>
	<276c2cab-659f-ad1a-d3a3-0e0df9a439c9@redhat.com>
	<CAMuHMdUuWT+-7wGg2SYTvtQV0Cy64N5GYTB0b-3gXPS3KLoO2w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <303a110d-7cb6-9003-e225-7f9d87d78811@redhat.com>
Date: Tue, 7 Aug 2018 17:05:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUuWT+-7wGg2SYTvtQV0Cy64N5GYTB0b-3gXPS3KLoO2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 07 Aug 2018 15:05:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 07 Aug 2018 15:05:57 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 1/4] vfio/platform: Make the
 vfio-platform device non-abstract
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <damm+renesas@opensource.se>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IrwrnRqmyoTw

Hi Geert,

On 08/07/2018 05:00 PM, Geert Uytterhoeven wrote:
> Hi Eric,
> 
> On Tue, Aug 7, 2018 at 4:18 PM Auger Eric <eric.auger@redhat.com> wrote:
>> On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
>>> From: Auger Eric <eric.auger@redhat.com>
>>>
>>> Up to now the vfio-platform device has been abstract and could not be
>>> instantiated.  The integration of a new vfio platform device required
>>> creating a dummy derived device which only set the compatible string.
>>>
>>> Following the few vfio-platform device integrations we have seen the
>>> actual requested adaptation happens on device tree node creation
>>> (sysbus-fdt).
>>>
>>> Hence remove the abstract setting, and read the list of compatible
>>> values from sysfs if not set by a derived device.
>>>
>>> Update the amd-xgbe and calxeda-xgmac drivers to fill in the number of
>>> compatible values, as there can now be more than one.
>>>
>>> Note that sysbus-fdt does not support the instantiation of the
>>> vfio-platform device yet.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> [geert: Rebase, set user_creatable=true, use compatible values in sysfs
>>>       instead of user-supplied manufacturer/model options, reword]
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> v3:
>>>   - Read all compatible values from sysfs instead of using user-supplied
>>>     manufacturer and model options,
>>>   - Reword patch description,
>>>   - Drop RFC state,
>>>
>>> v2:
>>>   - No changes,
>>>
>>> v1:
>>>   - Rebase, Set user_creatable=true,
>>>
>>> v0:
>>>   - Original version from Eric.
> 
>>> --- a/hw/vfio/platform.c
>>> +++ b/hw/vfio/platform.c
>>> @@ -655,6 +655,25 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
>>>          goto out;
>>>      }
>>>
>>> +    if (!vdev->compat) {
>>> +        gchar *contents;
>>> +        gsize length;
>>> +        char *tmp;
>>> +
>>> +        tmp = g_strdup_printf("%s/of_node/compatible", vbasedev->sysfsdev);
>>> +        if (!g_file_get_contents(tmp, &contents, &length, NULL)) {
>>> +            error_report("failed to load \"%s\"", tmp);
>>> +            exit(1);
>> You should set errp instead so that the error gets properly propagated.
> 
> Thanks, will do.
> 
>>> --- a/include/hw/vfio/vfio-platform.h
>>> +++ b/include/hw/vfio/vfio-platform.h
>>> @@ -54,7 +54,8 @@ typedef struct VFIOPlatformDevice {
>>>      QLIST_HEAD(, VFIOINTp) intp_list; /* list of IRQs */
>>>      /* queue of pending IRQs */
>>>      QSIMPLEQ_HEAD(pending_intp_queue, VFIOINTp) pending_intp_queue;
>>> -    char *compat; /* compatibility string */
>>> +    char *compat; /* DT compatible values, separated by NUL */
>> by NULL characters?
> 
> "NUL" is the character ('\0'), "NULL" is the pointer.
Ah OK ;-)

Thanks

Eric
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
