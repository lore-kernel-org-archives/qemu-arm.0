Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2527002wrw;
        Wed, 7 Nov 2018 11:43:12 -0800 (PST)
X-Google-Smtp-Source: AJdET5c9t0kuztp3vO2arqKdQYnovdNpJm9JbpWzgPDsqJurElaPp+RuCjrHD1rgmk+xIhZxPuuV
X-Received: by 2002:ac8:1c17:: with SMTP id a23mr1690907qtk.16.1541619792484;
        Wed, 07 Nov 2018 11:43:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541619792; cv=none;
        d=google.com; s=arc-20160816;
        b=MzIGJiLLEMznpB2s7eC0E0l3GuhjeStGO/Kl7x9xmpbCqTEXxIOLXyqsh3qpjZg1O6
         eiv+EL0Nrrrn3Z3Oks6g1HBEkFQCqgGSbamjDRfmfO41meMsEywNYMt4mpip1cE1dk+k
         hUhP6pILtkLao9FWrfAzVN5QxrjeiGB3LqUBUWKp2cKCRslFIObpzUOCEmqjSpN80AUG
         Ik3MoUGuKua/jdGRPjDSmBiMMqLLNkQDBCsreir3sDF/B24ZSAYmBPrND4dyXEOtILk9
         LAYdWKcmWx9vKtnouiVx+XJVy44XpDaEQQ2utM1GE/ZbYpOMQQ6TtaxYENRlFMBpyD/X
         CJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=FdmXbV4pTA7B38iVRFAiIqj7PSlehcyRctPvkIjvNmc=;
        b=VROKj6Fs5IRudE2BxK5igPX5jl9X41K0aOiQVInIWFMYzeeBQoVqo07xHju6T+SrE6
         E4Y879/ZoBhbLGT9Fuk5ukWkTfJQSM16UYe5hlW3I16Nu122+sVtwyjFfjidyKw41fn7
         m3WbqCAz4J82yO9DqQ0NVivHbP7ocmjRyMuaHs1lFp8nCAgkwDUkPhRf8cwprEVDET+H
         2rcqYyL+ywvQHza3ChPmJwcQnoU5wK2/F7hKWmc7eVPpMWKxSs719JtHEMTyobbHIOyt
         NAJVhCXYdtmApEnErYrAnN4VwiyjlJuYNGR2+xsyjh4DFqLQAy77EELUMCcE8gBLAXOQ
         tnxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gzgIScXa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si1175016qvk.217.2018.11.07.11.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 11:43:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gzgIScXa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKTjM-00012t-1V
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 14:43:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gKTiw-0000u1-AA
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 14:42:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gKTiu-0004sX-La
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 14:42:46 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gKTis-0004jZ-9J
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 14:42:44 -0500
Received: by mail-ot1-x344.google.com with SMTP id 40so15673951oth.4
	for <qemu-devel@nongnu.org>; Wed, 07 Nov 2018 11:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FdmXbV4pTA7B38iVRFAiIqj7PSlehcyRctPvkIjvNmc=;
	b=gzgIScXaT+Dfr0hW5FjQLdHfezp+J0TgbwXe3mGRZCDoLaMnNHz0cIlQFLD2d1u2vU
	+Aw4UYednfOjdZCrZoEVWAalo4yhuQgcnAH+Ky1dLPZB+KLOx2uqGzs5d9VioL6c/+nE
	Fc+e17f7lhz8H/WplW1uvu9YNK48BbeoiyhNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FdmXbV4pTA7B38iVRFAiIqj7PSlehcyRctPvkIjvNmc=;
	b=e4xrIZxCs4wt+AQx86D2n7NODZN/XeqKwjt0h4nsJx3QToHZdmOr7P+RN60mDv58OX
	AVX3305vek1yXl+VezsCmT3VOp2Lx7SIGawirZHQ2PZWKdT20dO61ncaI8dHlD4vbb8H
	Et0/qDdrqva9odoKdPB/tu9K/LkrOP7TKZj5pLFobwN7V42cf28rEh1R1GXud+owkICp
	8qR3mmArwSdht/CpJcGPudzY8QAs6kRmdgsK+N5gFqha9B2jnGCB9ZqiP5NBGJ9XwiLu
	VEPR/FtLpscFqd1fq59RI5IT+kgx36lUynmoLoWZ+KRJ0VMj9dqsJas9rCf5Nw40BUa/
	MI5A==
X-Gm-Message-State: AGRZ1gLeFK2CAfYFaqOkGDK+NE27ny0dC44pc+1HtTUm9G+YoRKfKbjT
	yvbpKAGTiIL/eX2tPUpSvScvoJ08DdGncqVjNswLXg==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr1031592oth.238.1541619752696; 
	Wed, 07 Nov 2018 11:42:32 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Wed, 7 Nov 2018 11:42:11 -0800 (PST)
In-Reply-To: <4b0e9b3f-5d88-9ef2-d0c5-f241067001d0@redhat.com>
References: <1541528230-31817-1-git-send-email-thuth@redhat.com>
	<c0febf9a-f098-112d-9c8d-c320cc66b04a@redhat.com>
	<12974ebb-09de-c6e9-1dd7-5199a8ae6b05@redhat.com>
	<CAFEAcA-B74FQgj3COyGZ_SAAvSUA6=OaLdy5--NoAgHgEGZkpg@mail.gmail.com>
	<87k1louaze.fsf@dusky.pond.sub.org>
	<4b0e9b3f-5d88-9ef2-d0c5-f241067001d0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Nov 2018 19:42:11 +0000
Message-ID: <CAFEAcA_N7zeuMGGvUBC6xu-AK2gH0n+aNwJOkhs7yWFx_3DbsQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Add an entry for the 'collie'
 machine
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
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SSIOH8UIathb

On 7 November 2018 at 19:39, Thomas Huth <thuth@redhat.com> wrote:
> On 2018-11-07 17:08, Markus Armbruster wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On 6 November 2018 at 18:52, Thomas Huth <thuth@redhat.com> wrote:
>>>> On 2018-11-06 19:49, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>> On 6/11/18 19:17, Thomas Huth wrote:
>>>>>> There is no active maintainer, but since Peter is picking up
>>>>>> patches via qemu-arm@nongnu.org, I think we could at least use
>>>>>> "Odd Fixes" as status here.
>>>>>
>>>>> This looks more as "Orphan" to me...
>>>>
>>>> I'll leave it up to Peter for the final decision...
>>>
>>> I think we're not very consistent[*] in our usage of the various
>>> statuses in the MAINTAINERS file. I guess "Odd Fixes" makes
>>> sense in that, well, if you send a patch to this
>>> code and cc me I'll review it and put it in the tree. (This
>>> is true of any of the arm boards we have.)
>>>
>>> [*] We have one thing tagged Orphan, which is bsd-user/,
>>> and some things tagged Odd Fixes with no listed maintainer,
>>> and some things tagged Odd Fixes which are in practice more
>>> like Orphan (for instance sh4), and we list "fpu/" as
>>> Odd Fixes despite having given it a pretty thorough
>>> overhaul very recently, and so on...
>>>
>>> If you wanted a mechanizable rule, you could try something
>>> like "every file which is in status Odd Fixes or better
>>> must list with M: at least one named individual who has
>>> submitted a pull request in the last nine months" :-)
>>
>> Sounds like an excellent idea to me!
>
> Well, for me "odd fixes" means that there is someone around who might
> pick up the patch and throw it into a PULL request. "Orphan" means it's
> mostly in vain to send patches for this subsystem, since there is nobody
> going to pick up your patch. So for the ARM boards, I'd say that "odd
> fixes" is a better choice, since Peter still picks up most of the
> patches via the "L: qemu-arm@nongnu.org" (big thanks for this, by the way=
!).

I think there should be a named person, though. A list
isn't a maintainer (at least not for the big whole
subsystem lists we have).

thanks
-- PMM
