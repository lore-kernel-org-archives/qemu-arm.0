Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2894809lfo;
        Tue, 15 Mar 2022 07:03:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9RoycCCJidOtyOn8kIjkV82pijFNChec2zieiAKzw4nMOH/j1X3tp9PUx3USqwDOyveFX
X-Received: by 2002:a05:6402:2023:b0:416:2c7:945c with SMTP id ay3-20020a056402202300b0041602c7945cmr25512679edb.148.1647352993651;
        Tue, 15 Mar 2022 07:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647352993; cv=none;
        d=google.com; s=arc-20160816;
        b=jspNwZzbbcR0C7TOhXqAcWH4ChA91PDyTjvTlw/uV6lQQeabceICLVt2kZoZjX1n88
         d56RhED7wOqht0xPwR2M/ORbZwkDzdVPHcktLX8td/sUd8zBLUrONXhmC4R2RhdpgSu1
         XOeOYYcjzzAp1NKES58x1ImOgfVu7tKO0kRda5Sx9iATQyWQbeey3+i2kFpvR6e0RSow
         PlDLpoTAOYv+pBimY2HBSkuyKGpytjpVm1QlpsgOs5R0rjpcwECY+KaRb03NyVfSq1It
         8knfWlfAEZfi0Gy2sploSHn0f3Ds0CytwVf0qYHyBXO5XF0CxgjgCDB/9xXDCmjLoVXZ
         cD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=MKik6AtmKkZjLoAeTfrbKw62PODykM0Fa40qjwa00Cw=;
        b=IjCdzBc+oSuI5jtRWzyAD7GV8C3YaEsDiryL7dHe1gbrSo+jLzb7BPIEq7hg+u1zvv
         fko0qg/9LdwzVF9sZ2y5j68zpgqJitfu02Kj4oAC904QY2YYAEX4lt6a8oAzCIpUWuOv
         mWgC2fhLniZXtfhrTIc/fRUkAtkJAOfiHN5GuzVWjnihgMnWzmd6yh1sm7OBSUA54juG
         ibwamse+bym/f5yc9Gixw6Zb2q9tIXWBmo4/Iy3AHoel1PdSWnerxMW7D/Wd2ya+QqQg
         AHPGyENxynNBXYfH/fr64qsX7RItEX+CoARxvkoxLRiv9/gSKXFgjx5qHiYTSusE3Dv5
         +CWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZrZAqGVa;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id eg3-20020a056402288300b0041855d3ce8bsi5823404edb.550.2022.03.15.07.03.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Mar 2022 07:03:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZrZAqGVa;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647352992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKik6AtmKkZjLoAeTfrbKw62PODykM0Fa40qjwa00Cw=;
	b=ZrZAqGVau8Sxjhc1470Ore8CqkcIMd+pDFtNFQrHlYA42vbX1e7hHa8W7U2QUY7hPrtHZH
	p8VOrwdl4jo398nH1DmNDop5BScXTBFMPBnxmIfxolAmQyPAixvwYsBHAtxWgS3CNsu14r
	U582pLsrl2QE/sa2sxl76NEESQgtWWs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-LExbIUHVMB2k-e1e--Crmg-1; Tue, 15 Mar 2022 10:03:10 -0400
X-MC-Unique: LExbIUHVMB2k-e1e--Crmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7419380390A;
	Tue, 15 Mar 2022 14:03:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CC1AC53741;
	Tue, 15 Mar 2022 14:03:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 32B4B21E6821; Tue, 15 Mar 2022 15:03:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Christian Schoenebeck <qemu_oss@crudebyte.com>,
  "Gonglei (Arei)" <arei.gonglei@huawei.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Igor Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,
  Laurent Vivier <lvivier@redhat.com>,  Amit Shah <amit@kernel.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Anthony Perard <anthony.perard@citrix.com>,
  Paul Durrant <paul@xen.org>,  =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>,
  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Corey Minyard
 <cminyard@mvista.com>,  Patrick Venture <venture@google.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Peter Xu <peterx@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  Daniel Henrique
 Barboza <danielhb413@gmail.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Jean-Christophe Dubois
 <jcd@tribudubois.net>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Yuval Shaia <yuval.shaia.ml@gmail.com>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Magnus Damm <magnus.damm@gmail.com>,
  Fabien Chouteau <chouteau@adacore.com>,  KONRAD Frederic
 <frederic.konrad@adacore.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Artyom Tarasenko <atar4qemu@gmail.com>,
  Alex Williamson <alex.williamson@redhat.com>,  Eric Auger
 <eric.auger@redhat.com>,  Max Filippov <jcmvbkbc@gmail.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  David Hildenbrand <david@redhat.com>,  Wenchao
 Wang <wenchao.wang@intel.com>,  Colin Xu <colin.xu@intel.com>,  Kamil
 Rytarowski <kamil@netbsd.org>,  Reinoud Zandijk <reinoud@netbsd.org>,
  Sunil Muthuswamy <sunilmut@microsoft.com>,  Cornelia Huck
 <cohuck@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,  John Snow
 <jsnow@redhat.com>,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  xen-devel@lists.xenproject.org,  qemu-ppc@nongnu.org,
  qemu-block@nongnu.org,  haxm-team@intel.com,  qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
References: <20220314160108.1440470-1-armbru@redhat.com>
	<20220314160108.1440470-4-armbru@redhat.com>
	<20220315090748.acju5mjbe4tax272@redhat.com>
Date: Tue, 15 Mar 2022 15:03:02 +0100
In-Reply-To: <20220315090748.acju5mjbe4tax272@redhat.com> (Eric Blake's
	message of "Tue, 15 Mar 2022 04:07:48 -0500")
Message-ID: <87zglrjotl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-TUID: LpsUX4Wsfs/a

Eric Blake <eblake@redhat.com> writes:

> On Mon, Mar 14, 2022 at 05:01:08PM +0100, Markus Armbruster wrote:
>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>> for two reasons.  One, it catches multiplication overflowing size_t.
>> Two, it returns T * rather than void *, which lets the compiler catch
>> more type errors.
>> 
>> This commit only touches allocations with size arguments of the form
>> sizeof(T).
>> 
>> Patch created mechanically with:
>> 
>>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
>> 	     --macro-file scripts/cocci-macro-file.h FILES...
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
> I agree that this is mechanical, but...
>
> <snip>
>>  qga/commands-win32.c                     |  8 ++---
>>  qga/commands.c                           |  2 +-
>>  qom/qom-qmp-cmds.c                       |  2 +-
>>  replay/replay-char.c                     |  4 +--
>>  replay/replay-events.c                   | 10 +++---
>>  scripts/coverity-scan/model.c            |  2 +-
>
> ...are we sure we want to touch this particular file?

Good catch!

>> diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
>> index 9d4fba53d9..30bea672e1 100644
>> --- a/scripts/coverity-scan/model.c
>> +++ b/scripts/coverity-scan/model.c
>> @@ -356,7 +356,7 @@ int g_poll (GPollFD *fds, unsigned nfds, int timeout)
>>  typedef struct _GIOChannel GIOChannel;
>>  GIOChannel *g_io_channel_unix_new(int fd)
>>  {
>> -    GIOChannel *c = g_malloc0(sizeof(GIOChannel));
>> +    GIOChannel *c = g_new0(GIOChannel, 1);
>>      __coverity_escape__(fd);
>>      return c;
>>  }
>
> Our model has a definition of g_malloc0(), but I'm not sure whether
> Coverity picks up the macro g_new0() in the same manner.

I believe it does, by parsing the macro definition from the header.

Regardless, I'd prefer to keep model.c self-contained.  I'll drop this
hunk.

Thanks!
