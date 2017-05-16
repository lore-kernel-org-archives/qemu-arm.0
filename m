Received: by 10.25.0.6 with SMTP id 6csp1735367lfa;
        Mon, 15 May 2017 23:42:00 -0700 (PDT)
X-Received: by 10.200.56.243 with SMTP id g48mr10080887qtc.79.1494916920195;
        Mon, 15 May 2017 23:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494916920; cv=none;
        d=google.com; s=arc-20160816;
        b=VvaJzkUEj9bXbONV9TvlzJoNqs6cUNKi/h3q55ZsGJ5e5MTucG+rwFRk2vAPm3gDRA
         l3SDNEpedzeSRg1TYf8eWajbq40kjWB9T6Jg2ivioytQqMQfzmdpYYJ5o/iy1jrwRYJq
         Lv/zyjm4Vk74I1cThR73dXQ1WP12iJoqd2x48/p43PyGPS4tZzXgW8ZkPyl5n+44LG8i
         pRJH+j1Trb+tXHk3IVG7bQ9rvNdlLf4PBFUxF3cwCOGaWcvsBxGIYiB2Qg2zevX/+LQc
         GsRSQXv3z7B92TcuvG1UmseVPQSSnt/HbuW1PwMLW5hiKZ2XfnekNFHmXeIulBPlQB3/
         h0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6vAkV352Gi4rp42xIUkf+E4XmrBfAdr0TawbUvcPck0=;
        b=bKrontUdebhgIglxKmQfGy5GJfOz7LEcOjmspHhR0hdzHUR86EBfOHXVchj6X0TqHP
         +dNTE5hTsIhODEez+URDimE3OezJKyPVc+WVtnDRLWsgxpuo9Swo4rzcUrES8wqzURqX
         w4UaMewfwB5LFVGiiuuP2Sg26PJA3V49VP4Y1sASEE3foCHmhBt5RyG2zPZm0n6YL+a6
         Mx6cwgaq5jK1T+VVbIMWt29aGHvH3QuA9K9Y+cRRWB0uxaOwiXlnepPDoK0S+oWrIO/+
         Y2ngfUNm0tYuEpD/b1TAGki7MJW1CHXE3L7k1jItNl8QtrCG5j8MUHbjT+78sbK/tIxh
         Y8zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r66si12823892qkb.243.2017.05.15.23.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 May 2017 23:42:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAWBC-0001Vn-BB
	for alex.bennee@linaro.org; Tue, 16 May 2017 02:41:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAWB2-0001UW-1q
	for qemu-arm@nongnu.org; Tue, 16 May 2017 02:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAWB1-0005jV-AU
	for qemu-arm@nongnu.org; Tue, 16 May 2017 02:41:48 -0400
Received: from mail-yb0-x229.google.com ([2607:f8b0:4002:c09::229]:33657)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dAWAw-0005eE-B9; Tue, 16 May 2017 02:41:42 -0400
Received: by mail-yb0-x229.google.com with SMTP id j17so33124433ybj.0;
	Mon, 15 May 2017 23:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6vAkV352Gi4rp42xIUkf+E4XmrBfAdr0TawbUvcPck0=;
	b=n4FSUhrqxOd3orc3IzhfE+FybHfWfyWmqKRLPwbqF5lvtuMK6tR0nuWk8BWUpwAqlC
	vkVuLVsXoEVxmAufmsD710T4AePm2q7G7ige6WBHW5B/7PSvBCSGxY33q+Q65vqWmXOI
	/n+Yq8VU6AQKc4JIYcvYMhYC4Q9odi9++V9Y0/Ii30g7QfONPjbpdry1YFdlYiT226X6
	fhlslik3+I+Vu9N7uTXGoVyS6DuGGjJhzdnGpMyJlixt5rdb/YR5JsdB6WlbPrBfYmvy
	nipEJuHT+Lm5o/Fi2Ew6ceDei77+bWclPnbdGGhN8O8upfauHLIGUxihgGzklHyPbYI1
	zCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6vAkV352Gi4rp42xIUkf+E4XmrBfAdr0TawbUvcPck0=;
	b=PPrWaxNrIaWlSeDvKt1bmSBTt9AQo7Tmw7QO8StUPQfKFYVkZglcY59kyC4kuTlfJJ
	edM7/q+QzGzKPuk8N4bvra01m8jei8LlzpProlMwT75dxAP4mNyH24EcVBvICARmIhtd
	hskZ+ObhV0LZucsPNLQD18nnu+JypxoS4EaMeNhqrfyvjLMExF5ZCsCKI/EZkOfx7apM
	6iCGlvw0JlQU33G569x3I7dbHUb0PQ1Kdal5MNMbmtbMzVYNFLYpYB6BvODyDs+JlKrE
	NK+hIJhCs4HX8VOvY85V/Gl/6vdIZFiBW/QFJIkhvUdGlhfcEnLAh0zYGS5VABZ6YT3g
	1nNg==
X-Gm-Message-State: AODbwcDm/NKBjkM037j6qjCumshV/dnVMTklKsHNONQQZibLrdmqbxR4
	/mf9pTv4lntMcKFEVFojSoUyEst79w==
X-Received: by 10.37.164.200 with SMTP id g66mr8321801ybi.147.1494916901696;
	Mon, 15 May 2017 23:41:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Mon, 15 May 2017 23:41:41 -0700 (PDT)
In-Reply-To: <d82b2e7c-e983-b227-b300-ceea0bd8b2cb@amsat.org>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-2-git-send-email-sundeep.lkml@gmail.com>
	<e87597ba-4759-76a5-7b0d-3297d2eb8f79@amsat.org>
	<d82b2e7c-e983-b227-b300-ceea0bd8b2cb@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Tue, 16 May 2017 12:11:41 +0530
Message-ID: <CALHRZurDU8fS3GSKproqP83Un2mVnJ75ptydf4QsRZvyzsZz1Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="94eb2c13ad1ee4fb85054f9e7665"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::229
Subject: Re: [Qemu-arm] [Qemu-devel PATCH 1/5] msf2: Add Smartfusion2 System
 timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XCgwl6TjPaU3

--94eb2c13ad1ee4fb85054f9e7665
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Mon, May 15, 2017 at 5:22 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Subbaraya,
>
> +        if (value & TIMER_MODE) {
>>> +            qemu_log_mask(LOG_UNIMP, "64-bit mode not supported\n");
>>>
>>
>> No need of trailing '\n', be more specific, something like:
>>
>>     qemu_log_mask(LOG_UNIMP, TYPE_MSF2_TIMER ": 64-bit mode not
>> supported");
>>
>
> I mistaken with error_report(), qemu_log_mask() does use trailing newline=
,
> sorry!
>

thats ok :)

Thanks,
Sundeep

>
> Phil.
>

--94eb2c13ad1ee4fb85054f9e7665
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Mon, May 15, 2017 at 5:22 PM, Philippe Mathieu-Daud=C3=A9 <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4=
bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Su=
bbaraya,<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; TIMER_MODE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;6=
4-bit mode not supported\n&quot;);<br>
</blockquote>
<br>
No need of trailing &#39;\n&#39;, be more specific, something like:<br>
<br>
=C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, TYPE_MSF2_TIMER &quot;: 64-bit mode =
not<br>
supported&quot;);<br>
</blockquote>
<br></span>
I mistaken with error_report(), qemu_log_mask() does use trailing newline, =
sorry!<br></blockquote><div><br></div><div>thats ok :)</div><div><br></div>=
<div>Thanks,</div><div>Sundeep=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Phil.<br>
</blockquote></div><br></div></div>

--94eb2c13ad1ee4fb85054f9e7665--
