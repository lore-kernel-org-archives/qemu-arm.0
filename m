Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp691094ejb;
        Mon, 19 Feb 2024 05:36:16 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVHQvBToGCN2pUuu4uptXW6ZxhZPm+H4gmdVCak2ZfbppMFjnCO/0XSJlz/BT/hvd4ek+e+L4bJyQ/44ZARQPh+qCxgS577
X-Google-Smtp-Source: AGHT+IHynBlJwBPPxHasuYVeJn2O8g8L/SUtB3fap20GY/priYCogbU8ku0oc6gGOt/+1l33awL3
X-Received: by 2002:a05:6358:620c:b0:178:6363:5c67 with SMTP id a12-20020a056358620c00b0017863635c67mr14984104rwh.21.1708349775936;
        Mon, 19 Feb 2024 05:36:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708349775; cv=pass;
        d=google.com; s=arc-20160816;
        b=AtezqYABF1Ox0+PtbAgyTXMsocy5DJiYb+UrAVzA/lhwzTcW0PBcA/aWjE4HvhZd2h
         Sy6rf5ROTDHyiNbIrGyoByUrPgycQKCR5m9IfKO7D/0b+2+mYZGM+eG+ppkV5G9WmnzP
         avaaEOh5xpOEt0r0pMNdsEARnlUEH+KVbfU5KOVl8APzkzswF+jyccqBtF8rsyytL79K
         J9+IqjYwfPrcwY66iIfdyDtVPASaUTEXfU0zT16yzAC0tabcw+MYI/ksqlIraU9q1YiV
         /kOU9obFtmGlCB9sSPZ967QWbV+uKvZglhJmKgufA2u1IZee4If4AkesjNWRUCDYgbH3
         WguA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=wBS7p74C18vfgjZS21+4+584H1doL/iiQgs2ufqQxso=;
        fh=6UethTmsSv7R2H646tTYRN7W7uyEwkTOanK9VKZwLC4=;
        b=qSliYqCtRLAeB9on1ExtzMcGLMUbjjsJBntO/bpxcPH7+lM1evpH7oxmzV2WuBa/0H
         QajvrfMehTQX7++R1hbc6+i3JuMbDlvVZNIqKMz2oO25qCsK8YUciBKspy751wkXOHnJ
         UEXWhRY5kYhWDNZfeyx+x8wYj8vYavTu3H7dyyv6JYoSOzTXTjIIIK88H2O6j3RutOoS
         lKnOC6y4Hi9p4ONgeGOr15cztW9Al9VrAGNh5tTk4QG0KAOdL5FQcUg8xHFI3MRc2Dis
         eMYfQ+BHPokRjNhRpvnUkGljY7cmKNXihV/YMJaXuygM6z7r7XHOqEWh8hBO7EddrIdR
         qSjw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zL4grO8J;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-9087-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-9087-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-9087-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id r5-20020a632b05000000b005ce172ef504si4459522pgr.36.2024.02.19.05.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 05:36:15 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-9087-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zL4grO8J;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-9087-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-9087-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73936283552
	for <alex.bennee@linaro.org>; Mon, 19 Feb 2024 13:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137303613C;
	Mon, 19 Feb 2024 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zL4grO8J"
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2AF364A4
	for <kvm@vger.kernel.org>; Mon, 19 Feb 2024 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708349766; cv=none; b=X+bnJdNiOCDv8RtgptXTcAXJIFy0KlnBxhXWCbbs16lsL8WuMimF+zHG8dK+4NmlAnAnqUfGcpl22CyxYYVEMJCYXttbu9aRR+SKEMbSbQ70ouw4Vce5vH8/EOuPxPfSVPM73C49KjX7qQ1/7byf5XITGxKFRui5NkMMJk1dMwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708349766; c=relaxed/simple;
	bh=wBS7p74C18vfgjZS21+4+584H1doL/iiQgs2ufqQxso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeIsa5Un4YmrRK6wGiWKr2ijeRUd7eQJFwyDbTIADmGoXSvUPcn+uhpeRxZQ26h9UgctQHIXp3vhSQq9JwSaJ4HIcg9JW+W9cWL4uvxmaMInGdEjnQYZH2TtTmQC4VQ5CahJF47K/bvrXxtmulslPvMl2DgKzHIvHaFy94NMnA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zL4grO8J; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-564647bcdbfso1186155a12.2
        for <kvm@vger.kernel.org>; Mon, 19 Feb 2024 05:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708349763; x=1708954563; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wBS7p74C18vfgjZS21+4+584H1doL/iiQgs2ufqQxso=;
        b=zL4grO8J0G7cO9HkOOtIc+E/YUeq0Yndpvv+G37Prx6/jq5AyH773zm4kggHoj9chn
         uBYWe9AQuXpt7IwfIifD5/mOgqmX43dthoulSib+2AbZXuot8H0WbU4AZMmXJy2yGJEf
         xJ04rIQIi1j0JNiWPI9bMJl9BX8Rgjaw8PW0aMddKih9Ol677NCmaiVsQYsjODhacXl7
         YokROBF5bUY0431t+rTeTVQ6Cv902DrIYzeEZILnFXW47taFbyJLVsiYzwRVYd6i2Kyg
         MZUr27ekk17E25OE7562hQWwlxx8vfvg/TYRp+7bp3M7WtJgt56lEU97xGczkwzvG1ZW
         gL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708349763; x=1708954563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBS7p74C18vfgjZS21+4+584H1doL/iiQgs2ufqQxso=;
        b=sVIs7n9hpLXRpVfYFnNHrAYVH2GqVi0JO4KLia6Y16oQQJrbyOFrvbTNbliJXgO2Zh
         k+yH1XJsqIiiOJOc8BvA54sjfBntWeRZiVOJ7t3cRR4u6Cake/4O6HMRj7hP+2vrA8Nb
         KhidCPj0DmDDGbxcyVlkK8GJt3oPgupsXUkEx/ywsTpmlVl5zAa6exNA3QDYeCxlrfnj
         MHB8XCOaAyXbspE2UAVHUsLVLgqMDwfe/frAw812P/RKk2CWemRG+9LHP20Wes94Twor
         iF8BAdXvIMW0JypaWa3cunoHlSpYHWhHhklautuZr+GOfKeJ1MZ+vDlyCbZqLvlRIp7H
         lfpw==
X-Forwarded-Encrypted: i=1; AJvYcCWYTv4xajcQbt/SIeggWtXIlHu+At54D3uWAO7SbvExI1RjCNpldTcP4bMrJPgyuC874wDXlG7Sje9LU1FnWyB26R3e
X-Gm-Message-State: AOJu0YzX8y+nOuzLNB1Tno68FtRu+8D5RKMepfbVKeHqwaSpCqax6Q8t
	LDJt3frn+mfTwEF5TDwOwfA0oCzLqBmppb5NJFNetpEuGDjfIW4tDh6f0Pla6+0LBchCEyITruV
	xG0BWKbicU9QxUEUmH1q8Gvga06xipf3X+Klf1w==
X-Received: by 2002:aa7:d455:0:b0:564:2519:5a74 with SMTP id
 q21-20020aa7d455000000b0056425195a74mr3438061edr.11.1708349763342; Mon, 19
 Feb 2024 05:36:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216153517.49422-1-philmd@linaro.org> <20240216153517.49422-2-philmd@linaro.org>
 <bcfd3f9d-04e3-79c9-c15f-c3c8d7669bdb@eik.bme.hu> <2f8ec2e2-c4c7-48c3-9c3d-3e20bc3d6b9b@linaro.org>
 <b40fd79f-4d41-4e04-90c1-6f4b2fde811d@linaro.org> <00e2b898-3c5f-d19c-fddc-e657306e071f@eik.bme.hu>
 <2b9ea923-c4f9-4ee4-8ed2-ba9f62c15579@linaro.org> <6b5758d6-f464-2461-f9dd-71d2e15b610a@eik.bme.hu>
 <bc5929e4-1782-4719-8231-fe04a9719c40@ilande.co.uk> <CAFEAcA-Mvd4NVY2yDgNEdjZ_YPrN93PDZRyfCi7JyCjmPs4gAQ@mail.gmail.com>
 <0a31f410-415d-474b-bcea-9cb18f41aeb2@ilande.co.uk>
In-Reply-To: <0a31f410-415d-474b-bcea-9cb18f41aeb2@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Feb 2024 13:35:51 +0000
Message-ID: <CAFEAcA9v4yh=K9+ND7R+KHC_0=fW39=fK7ScjE+HX-ip-KwQvw@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/arm: Inline sysbus_create_simple(PL110 / PL111)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, kvm@vger.kernel.org, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Markus Armbruster <armbru@redhat.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: TnLbqEk/TVdY

On Mon, 19 Feb 2024 at 13:33, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 19/02/2024 13:05, Peter Maydell wrote:
>
> > On Mon, 19 Feb 2024 at 12:49, Mark Cave-Ayland
> > <mark.cave-ayland@ilande.co.uk> wrote:
> >>
> >> On 19/02/2024 12:00, BALATON Zoltan wrote:
> >>> For new people trying to contribute to QEMU QDev is overwhelming so having some way
> >>> to need less of it to do simple things would help them to get started.
> >>
> >> It depends what how you define "simple": for QEMU developers most people search for
> >> similar examples in the codebase and copy/paste them. I'd much rather have a slightly
> >> longer, but consistent API for setting properties rather than coming up with many
> >> special case wrappers that need to be maintained just to keep the line count down for
> >> "simplicity".
> >>
> >> I think that Phil's approach here is the best one for now, particularly given that it
> >> allows us to take another step towards heterogeneous machines. As the work in this
> >> area matures it might be that we can consider other approaches, but that's not a
> >> decision that can be made right now and so shouldn't be a reason to block this change.
> >
> > Mmm. It's unfortunate that we're working with C, so we're a bit limited
> > in what tools we have to try to make a better and lower-boilerplate
> > interface for the "create, configure, realize and wire up devices" task.
> > (I think you could do much better in a higher level language...)
> > sysbus_create_simple() was handy at the time, but it doesn't work so
> > well for more complicated SoC-based boards. It's noticeable that
> > if you look at the code that uses it, it's almost entirely the older
> > and less maintained board models, especially those which don't actually
> > model an SoC and just have the board code create all the devices.
>
> Yeah I was thinking that you'd use the DSL (e.g. YAML templates or similar) to
> provide some of the boilerplating around common actions, rather than the C API
> itself. Even better, once everything has been moved to use a DSL then the C API
> shouldn't really matter so much as it is no longer directly exposed to the user.

That does feel like it's rather a long way away, though, so there
might be scope for improving our C APIs in the meantime. (Also,
doing the boilerplating with fragments of YAML or whatever means
that checking of eg typos and other syntax errors shifts from
compile time to runtime, which is a shame.)

-- PMM
