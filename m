Received: by 2002:a0c:eda5:0:0:0:0:0 with SMTP id h5csp5680014qvr;
        Tue, 27 Oct 2020 11:54:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwTC8p/a6RrAgWyDUxZmwssPTGBZY0PmKplrRvykDeGkHJq+jFX8IcScAOnZREPjdqHuHw
X-Received: by 2002:a05:620a:14b5:: with SMTP id x21mr3797413qkj.300.1603824859894;
        Tue, 27 Oct 2020 11:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603824859; cv=none;
        d=google.com; s=arc-20160816;
        b=LrFSfrrb25WaT64AvlNjGp+lMM1MQPNdmOl217qMepiYAsmrDGTfOyCRMZI57Tmskw
         bCIie8kcd21elTr7f/SScGgMImsKm32mwlTdy5W0A7QJZTBHUnLJl4pVld/MG9cJSV1p
         5jojxkIyMrND4vte+scUQlw0q3TvnmEEOwjMAFUg5KXlcOpw3kiTgmZXM8Gsh85u72fH
         SIDykO1etHIXE0xbMNxCCZeaXw4dndV60YrYqHoTZqZO2i+sBfLnluCJ8KKgQpQhqC59
         hVh2TRLjWYAOSNG+PhpTNro+yYVa35e8WW2GNs3UxLWYklbgfvQpPNY2b6wAzyxuSLTN
         Zbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=ZryAnamgoYu55ZEggUKNyRi7qSTAnJ9xlJ3QRoHz0lI=;
        b=RpGyow9e7AnkY5cbqyVksKiVPBnTJQj87yvKCjNxfMBqsl6qpiSRKF8ffzDzUdGDvq
         n2OV7fsexbpcPEm8FKk2g6x4mjZMEgb+G3RlVbe//XRExOsPA9fWQm2xktehxrHeLSTo
         pG0KrhTg5pvm/2nVRwBVOF88nqg7jtj5NStL4bBKx7YdwKzLiwHbKYlNvxNKY2Zar8B+
         Y6XYXXFdr6mc+9lEy0rPmvQF1bzhFkpShoafIxbW1vrIwk+0/tuoxJhs9UdgEOnqLdE7
         j43BIhOqHJbqPQs+CBIGIsbBcZXUTqHW966c4Rh+ADA+MPpiewdnGGT5xlM9hk9Yh+qz
         JFlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d08zkDQk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si1208278qvo.6.2020.10.27.11.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 11:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d08zkDQk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXU6t-0008Ey-EW
	for alex.bennee@linaro.org; Tue, 27 Oct 2020 14:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kXTy1-0008VW-Vf
 for qemu-arm@nongnu.org; Tue, 27 Oct 2020 14:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kXTxw-000672-Io
 for qemu-arm@nongnu.org; Tue, 27 Oct 2020 14:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603824303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZryAnamgoYu55ZEggUKNyRi7qSTAnJ9xlJ3QRoHz0lI=;
 b=d08zkDQkLeYI/dJjCLfA75vkKAktPXzW/lcRG8gUefoFIH0vLLH84RutneZKlWYvv7THaZ
 nF/NDFDf7S7fY2ngaX+L0r4d4cQt7vGbFyxASwjqWzxqFmI4cBtoAd0JK6os3Rj9ytdYTD
 Tk+/K1PLyvZh1He7Mi70j5G0ood5+5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-voIATndjN1akTHjPflgleA-1; Tue, 27 Oct 2020 14:44:57 -0400
X-MC-Unique: voIATndjN1akTHjPflgleA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02CD964ACA;
 Tue, 27 Oct 2020 18:44:51 +0000 (UTC)
Received: from [10.3.112.145] (ovpn-112-145.phx2.redhat.com [10.3.112.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4414B5B4BB;
 Tue, 27 Oct 2020 18:44:33 +0000 (UTC)
Subject: Re: [PATCH v6 11/11] qapi: Use QAPI_LIST_ADD() where possible
To: Markus Armbruster <armbru@redhat.com>
References: <20201027050556.269064-1-eblake@redhat.com>
 <20201027050556.269064-12-eblake@redhat.com>
 <873620vv3i.fsf@dusky.pond.sub.org>
 <677f78ec-4897-558c-1f51-35b6215caf64@redhat.com>
 <87r1pj65pz.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <38da85cd-83db-ea6d-9ebc-5838d776467a@redhat.com>
Date: Tue, 27 Oct 2020 13:44:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87r1pj65pz.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, pkrempa@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 rjones@redhat.com, Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 KVM CPUs" <qemu-s390x@nongnu.org>,
 "open list:GLUSTER" <integration@gluster.org>, stefanha@redhat.com,
 Richard Henderson <rth@twiddle.net>, kwolf@redhat.com,
 vsementsov@virtuozzo.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MZu0cMhvgd//

On 10/27/20 10:36 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> On 10/27/20 5:09 AM, Markus Armbruster wrote:
>>> Eric Blake <eblake@redhat.com> writes:
>>>
>>>> Anywhere we create a list of just one item or by prepending items
>>>> (typically because order doesn't matter), we can use the now-public
>>>> macro.  But places where we must keep the list in order by appending
>>>> remain open-coded.
>>>
>>> Should we rename the macro to QAPI_LIST_PREPEND()?
>>
>> That would make sense if we add a counterpart QAPI_LIST_APPEND.
> 
> It may make sense even if we don't.  QAPI_LIST_ADD() leaves the reader
> guessing whether we prepend or append.

That's a strong enough argument for me to make the rename in patch 2/11,
with minor rebase fallout in the rest of the series, and then this patch
gets a major rewrite (but I'm already not trying to get this patch into
5.2).


>>>> @@ -1224,10 +1224,7 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
>>>>      QTAILQ_FOREACH(mount, &mounts, next) {
>>>>          g_debug("Building guest fsinfo for '%s'", mount->dirname);
>>>>
>>>> -        new = g_malloc0(sizeof(*ret));
>>>
>>> Ugh!  Glad you get rid of this.
>>
>> Yep, C++ reserved words as a C variable name is always awkward.  It was
>> fun cleaning that up (several places in this patch).
> 
> I don't give a rat's ass about C++, actually.  I'm glad you got rid of
> the tacit "@new points to the same type as @ret does".
> 
> Clean:
> 
>              new = g_malloc0(sizeof(*new));
>              new = g_new0(GuestFilesystemInfoList, 1);
> 
> Clean (but I'd use g_new0() instead):
> 
>              new = g_malloc0(sizeof(GuestFilesystemInfoList));
> 
> Dirty:
> 
>              new = g_malloc0(sizeof(X));
> 
> where X is anything else.

Ah, I hadn't even spotted what you disliked, but yes, it makes total
sense that allocating for assignment to one variable by utilizing the
type from another puts unnecessary linkage that the two variables must
have the same type.


>>> Did you miss the spot where we add to this list?
>>>
>>>        /* Go through each extent */
>>>        for (i = 0; i < extents->NumberOfDiskExtents; i++) {
>>>            disk = g_malloc0(sizeof(GuestDiskAddress));
>>>
>>>            /* Disk numbers directly correspond to numbers used in UNCs
>>>             *
>>>             * See documentation for DISK_EXTENT:
>>>             * https://docs.microsoft.com/en-us/windows/desktop/api/winioctl/ns-winioctl-_disk_extent
>>>             *
>>>             * See also Naming Files, Paths and Namespaces:
>>>             * https://docs.microsoft.com/en-us/windows/desktop/FileIO/naming-a-file#win32-device-namespaces
>>>             */
>>>            disk->has_dev = true;
>>>            disk->dev = g_strdup_printf("\\\\.\\PhysicalDrive%lu",
>>>                                        extents->Extents[i].DiskNumber);
>>>
>>>            get_single_disk_info(extents->Extents[i].DiskNumber, disk, &local_err);
>>>            if (local_err) {
>>>                error_propagate(errp, local_err);
>>>                goto out;
>>>            }
>>>            cur_item = g_malloc0(sizeof(*list));
>>>            cur_item->value = disk;
>>>            disk = NULL;
>>>            cur_item->next = list;
>>> --->       list = cur_item;
>>>        }
>>
>> This is appending, not prepending.
> 
> One of us is blind, and it might be me :)

Oh, I indeed misread this.  Yes, this is prepending after all, so I'll
use the macro here.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

