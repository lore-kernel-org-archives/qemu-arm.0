Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3783165wrx;
        Mon, 4 Mar 2019 08:23:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYuEOvwAvKmYgfx+Dmm4V/iY6LIl+M5GeBwQF9i8nS86Yq6yG5Tx+MCxEXMLOes0xOkIp3
X-Received: by 2002:a25:b703:: with SMTP id t3mr15544722ybj.25.1551716639278;
        Mon, 04 Mar 2019 08:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551716639; cv=none;
        d=google.com; s=arc-20160816;
        b=h2XEuiDNVufpOGLQlfhG1ZLQ3PhlR0QWjnC7VwMI5+SA1TJk5boXoesCPKQKaUt0F7
         hRghW+Lo9gOVE/7aP09Gf4cCQXANR8zfJseWkXIIoOnmfjODXzrD0DxBRiRahBxg/zwu
         NPcGbTw/HDxfmeo5zaULHyzgjF7d4gZYml/lNUVnukmdeXAeOzsl5MQAjJ7vm6HmPoP2
         EWzWMM8j2NZCo8G3Mq72PlcuSOaDRVboSC6Cx6gbrD0vreU2zmKGOocwCU4f5apuT3rn
         YhAKBTisJpiyogJQJmKKOhKsYQy9KXjlRkvKKeYdlrO/qm3OlCnjWGtyumObmxGmGMOv
         me0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6sCoqYfnqyNlE8mfhfiPZ2Cn4UGELUhE0uxxSLvJTA8=;
        b=mPH0cxuAJP3OF5WhJAzj7ocL+cHLm1zIncXZ069ZFnRJeT9lBNpHVgnUEZ26Jce80N
         DrU0mLq50+LIYkuJYqRpi1NhicLT0ckV+oeaYKim9dPOfC1eoLdmW3P8m9MD2BdJunwv
         qd5sMZL8F17XkGaxQIdJVn7qZPXLGJgqK39J4uxijVidrcvrY586fG3pYgWMmmpvVhbL
         rgJjZvjwMZLswS49xKrXbsXpx0H6bWKBk4FtAkc3i2SgMeLg8k5kZqXQB11hye12AWk6
         cCu1tCGTVYuWKsCOn/NY+mGH/B5pxkSpHCbe5GMlwXONe92WextFVpy3AdC8z61UZ1Dc
         V1pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w64si3669215ywd.443.2019.03.04.08.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 08:23:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0qNi-0004FB-N6
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 11:23:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1h0qKL-0002MS-99
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 11:20:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1h0qKJ-0004nb-No
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 11:20:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44718)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mprivozn@redhat.com>)
	id 1h0qKF-0004bh-Op; Mon, 04 Mar 2019 11:20:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D77681F19;
	Mon,  4 Mar 2019 16:20:22 +0000 (UTC)
Received: from [10.43.2.30] (unknown [10.43.2.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B114A1001DF7;
	Mon,  4 Mar 2019 16:20:14 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com> <87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com> <20190304123908.GK4239@redhat.com>
	<20190304151641.3deefc3b@redhat.com> <20190304142432.GM4239@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <a6081774-c9d5-0496-3e65-ffb885408261@redhat.com>
Date: Mon, 4 Mar 2019 17:20:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20190304142432.GM4239@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 04 Mar 2019 16:20:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate 'mem'
 parameter of '-numa node' option
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W8F2R5rA3wVf

On 3/4/19 3:24 PM, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Mar 04, 2019 at 03:16:41PM +0100, Igor Mammedov wrote:
>> On Mon, 4 Mar 2019 12:39:08 +0000
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>
>>> On Mon, Mar 04, 2019 at 01:25:07PM +0100, Igor Mammedov wrote:
>>>> On Mon, 04 Mar 2019 08:13:53 +0100
>>>> Markus Armbruster <armbru@redhat.com> wrote:
>>>>   =20
>>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>>>>   =20
>>>>>> On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote:
>>>>>>> On Fri, 1 Mar 2019 15:49:47 +0000
>>>>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>>>>>>     =20
>>>>>>>> On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:
>>>>>>>>> The parameter allows to configure fake NUMA topology where gues=
t
>>>>>>>>> VM simulates NUMA topology but not actually getting a performan=
ce
>>>>>>>>> benefits from it. The same or better results could be achieved
>>>>>>>>> using 'memdev' parameter. In light of that any VM that uses NUM=
A
>>>>>>>>> to get its benefits should use 'memdev' and to allow transition
>>>>>>>>> initial RAM to device based model, deprecate 'mem' parameter as
>>>>>>>>> its ad-hoc partitioning of initial RAM MemoryRegion can't be
>>>>>>>>> translated to memdev based backend transparently to users and i=
n
>>>>>>>>> compatible manner (migration wise).
>>>>>>>>>
>>>>>>>>> That will also allow to clean up a bit our numa code, leaving o=
nly
>>>>>>>>> 'memdev' impl. in place and several boards that use node_mem
>>>>>>>>> to generate FDT/ACPI description from it.
>>>>>>>>
>>>>>>>> Can you confirm that the  'mem' and 'memdev' parameters to -numa
>>>>>>>> are 100% live migration compatible in both directions ?  Libvirt
>>>>>>>> would need this to be the case in order to use the 'memdev' synt=
ax
>>>>>>>> instead.
>>>>>>> Unfortunately they are not migration compatible in any direction,
>>>>>>> if it where possible to translate them to each other I'd alias 'm=
em'
>>>>>>> to 'memdev' without deprecation. The former sends over only one
>>>>>>> MemoryRegion to target, while the later sends over several (one p=
er
>>>>>>> memdev).
>>>>>>
>>>>>> If we can't migration from one to the other, then we can not depre=
cate
>>>>>> the existing 'mem' syntax. Even if libvirt were to provide a confi=
g
>>>>>> option to let apps opt-in to the new syntax, we need to be able to
>>>>>> support live migration of existing running VMs indefinitely. Effec=
tively
>>>>>> this means we need the to keep 'mem' support forever, or at least =
such
>>>>>> a long time that it effectively means forever.
>>>>>>
>>>>>> So I think this patch has to be dropped & replaced with one that
>>>>>> simply documents that memdev syntax is preferred.
>>>>>
>>>>> We have this habit of postulating absolutes like "can not deprecate=
"
>>>>> instead of engaging with the tradeoffs.  We need to kick it.
>>>>>
>>>>> So let's have an actual look at the tradeoffs.
>>>>>
>>>>> We don't actually "support live migration of existing running VMs
>>>>> indefinitely".
>>>>>
>>>>> We support live migration to any newer version of QEMU that still
>>>>> supports the machine type.
>>>>>
>>>>> We support live migration to any older version of QEMU that already
>>>>> supports the machine type and all the devices the machine uses.
>>>>>
>>>>> Aside: "support" is really an honest best effort here.  If you rely=
 on
>>>>> it, use a downstream that puts in the (substantial!) QA work real
>>>>> support takes.
>>>>>
>>>>> Feature deprecation is not a contract to drop the feature after two
>>>>> releases, or even five.  It's a formal notice that users of the fea=
ture
>>>>> should transition to its replacement in an orderly manner.
>>>>>
>>>>> If I understand Igor correctly, all users should transition away fr=
om
>>>>> outdated NUMA configurations at least for new VMs in an orderly man=
ner.
>>>> Yes, we can postpone removing options until there are machines type
>>>> versions that were capable to use it (unfortunate but probably
>>>> unavoidable unless there is a migration trick to make transition
>>>> transparent) but that should not stop us from disabling broken
>>>> options on new machine types at least.
>>>>
>>>> This series can serve as formal notice with follow up disabling of
>>>> deprecated options for new machine types. (As Thomas noted, just war=
nings
>>>> do not work and users continue to use broken features regardless whe=
ther
>>>> they are don't know about issues or aware of it [*])
>>>>
>>>> Hence suggested deprecation approach and enforced rejection of legac=
y
>>>> numa options for new machine types in 2 releases so users would stop
>>>> using them eventually.
>>>
>>> When we deprecate something, we need to have a way for apps to use th=
e
>>> new alternative approach *at the same time*.  So even if we only want=
 to
>>> deprecate for new machine types, we still have to first solve the pro=
blem
>>> of how mgmt apps will introspect QEMU to learn which machine types ex=
pect
>>> the new options.
>> I'm not aware any mechanism to introspect machine type options (existi=
ng
>> or something being developed). Are/were there any ideas about it that =
were
>> discussed in the past?
>>
>> Aside from developing a new mechanism what are alternative approaches?
>> I mean when we delete deprecated CLI option, how it's solved on libvir=
t
>> side currently?
>>
>> For example I don't see anything introspection related when we have be=
en
>> removing deprecated options recently.
>=20
> Right, with other stuff we deprecate we've had a simpler time, as it
> either didn't affect migration at all, or the new replacement stuff
> was fully compatible with the migration data stream. IOW, libvirt
> could unconditionally use the new feature as soon as it saw that it
> exists in QEMU. We didn't have any machine type dependancy to deal
> with before now.

We couldn't have done that. How we would migrate from older qemu?

Anyway, now that I look into this (esp. git log) I came accross:

commit f309db1f4d51009bad0d32e12efc75530b66836b
Author:     Michal Privoznik <mprivozn@redhat.com>
AuthorDate: Thu Dec 18 12:36:48 2014 +0100
Commit:     Michal Privoznik <mprivozn@redhat.com>
CommitDate: Fri Dec 19 07:44:44 2014 +0100

     qemu: Create memory-backend-{ram,file} iff needed

Or this 7832fac84741d65e851dbdbfaf474785cbfdcf3c. We did try to=20
generated newer cmd line but then for various reasong (e.g. avoiding=20
triggering a qemu bug) we turned it off and make libvirt default to=20
older (now deprecated) cmd line.

Frankly, I don't know how to proceed. Unless qemu is fixed to allow=20
migration from deprecated to new cmd line (unlikely, if not impossible,=20
right?) then I guess the only approach we can have is that:

1) whenever so called cold booting a new machine (fresh, brand new start=20
of a new domain) libvirt would default to modern cmd line,

2) on migration, libvirt would record in the migration stream (or status=20
XML or wherever) that modern cmd line was generated and thus it'll make=20
the destination generate modern cmd line too.

This solution still suffers a couple of problems:
a) migration to older libvirt will fail as older libvirt won't recognize=20
the flag set in 2) and therefore would default to deprecated cmd line
b) migrating from one host to another won't modernize the cmd line

But I guess we have to draw a line somewhere (if we are not willing to=20
write those migration patches).

Michal
