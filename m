Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp116997wme;
        Thu, 17 May 2018 08:23:55 -0700 (PDT)
X-Received: by 2002:a9d:210b:: with SMTP id i11-v6mr3705362otb.5.1526570635270;
        Thu, 17 May 2018 08:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526570635; cv=none;
        d=google.com; s=arc-20160816;
        b=B4NiRWu1MBUKm0/cmfMIgcJPvLy44NwzavDdtfuicKmtbD+6+gnNf+TIf/GcZ/ZRO2
         92oacOrKEeVB6c35rnX8rSxNSOmprNo9cQ2YAtmEIAbGT+IvQ3cRgEvXU0KRnSChdjtF
         zRavMzX74Nd/eDfi5GlJPBLwbhfD8yXFxO7vGy3GbAxENLh4c2frs16GZ7WUz78NZDpB
         VufJ/jXhwQWmatYQmaYGtWVR3iJDH/O8RTevFCje0YwmnKBwRUxkLlsmDkjIOqcJ5O07
         wMFz7+W9PMYfdRnIp71pjtyhgCHDoC5Yek9dxxZ4yfNzjZKakcmDZJvqPRRFp9ZY2Z0n
         u2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xQngky6Va5tWfX3Qypqa9rCzpcKE+H/AjHkRwL6tTlE=;
        b=IAb40+IPPxFnsdcuaNIzMiePYO5iJGiysuoopp4yx7UYyhuAnb52WG+PTw68NFH+UE
         suNZGO14zsXazsF+2cp41HgRge0anFgZ2Gsj+nQqTszPQY1YR3OMwrntE0SQVqbscdrP
         4OoDF/sEjYUqttCZB5YxUBGt4r8WHZp6iGxM38adtmN9wnWfSJSsDLaNiyZHv59N069H
         0RdLbgTcVeUFy05TCDOtS2iduhBIrU2UDAeVCxFi7nmm0dWwG9Bla2CreXUyg6h6SkZk
         5g4kriTm4dGwRjm345qZtzrnYRhAtnQx0oU1M3VcGfUF8RJ7dIwpws7J2pBnELBFDAwX
         DQbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vyt3NrgU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w49-v6sor3212474otb.300.2018.05.17.08.23.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 May 2018 08:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vyt3NrgU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xQngky6Va5tWfX3Qypqa9rCzpcKE+H/AjHkRwL6tTlE=;
        b=Vyt3NrgUPs1JIIyrJw71eTW427ZaRFT+acPsXjCIzG3A7w2g9TUj+HP3CFSFqC5Mw9
         3V6PL6XaZc1FHPtN8Eu0AjAfNghDQeAQt4SCymMFtecRtZY/kRu+F0w02989pgRoTGFi
         hG+En/HiKzJezMff3B8WrVLHkvRoCjXL6s11c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xQngky6Va5tWfX3Qypqa9rCzpcKE+H/AjHkRwL6tTlE=;
        b=MFT5ko+Uy72XDHm7sJkIl7iyDZFaZPIBVmEWJckAarvuwVErmfFRdfeGdgjhzKlNpH
         4VlQSsiHc8+H6cx+Cmbqu93bQ0Mm78/KB40EcQ2GUfmwO5/dVHHPu1kRN1SaLkuQ6is9
         PUP4TbmDj4KvUex/qcfMDmd4H2YK7OS1WxN30O6kHA3rO2rbJAiYQNbhAy9hiLnmMgUI
         lmP4CHchA0eyoze4KtrDOoZTwVOi11ZrtG3UL1PNX7Im8px/Q1Sqgeq9+gh8liqSI2BR
         2QVNcb0J3fOvMThuoEJx9jTA4qKEtY28MffAXn57lcBaiqrcuG9B9nB/NmPqvUshEHOe
         S05Q==
X-Gm-Message-State: ALKqPwcDVIuS9zMViy8uQk8rzqsWKnZtTVvg+ao6nniILRXjJvx0J86c
	IvujkIv3Qbbe9GshoFS+EB2eBWOaa3T6afm+5RmzhGtbTgY=
X-Google-Smtp-Source: AB8JxZqNxHc2pro4NUbP9RtYM8c4jgSo12px2YVsmVhemcM04iT3W5xqHEKWIIbipcQS8im3rWo+0ePCY5RnhwAXpUc=
X-Received: by 2002:a9d:2013:: with SMTP id n19-v6mr3737976ota.258.1526570634746;
 Thu, 17 May 2018 08:23:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 17 May 2018 08:23:34
 -0700 (PDT)
In-Reply-To: <87y3gkdlab.fsf@linaro.org>
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
 <87lgcrvemu.fsf@linaro.org> <CAFEAcA_3Rg-qhLRmg=TtakVtzOffKrdOKU8z=-=cGts4TTC2+A@mail.gmail.com>
 <87y3gkdlab.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 May 2018 16:23:34 +0100
Message-ID: <CAFEAcA8tcspnmGBOOF8zYX22dPRrD_HZ2z+Ot2CSqUo2RdKp1Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] target/arm: Add a dynamic XML-description of the
 cp-registers to GDB
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Khaled Jmal <khaled.jmal@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: x0aXMTyXfwUF

On 16 May 2018 at 10:03, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> CNTVCT_EL0 isn't in the set of registers we expose to gdb (it's
>> marked up as ARM_CP_NO_RAW), so I'm not sure why gdb is
>> giving you any value at all. Does it do that for any
>> random $no_such_thing strings ?
>
> *sigh* yes....

My gdb ("GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1") gives
(gdb) p/x $cntvct_el0
$3 =3D Value can't be converted to integer.
or if you don't ask for the hex conversion:
(gdb) print $cntvct_el0
$2 =3D void

so this is either something fixed in a newer gdb than you
have, or alternately it's a regression if you're using a
newer gdb, which you should probably report upstream...

> So finally:
>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks for the testing.

Abdallah: I've added this series to my target-arm.next queue,
so it should reach QEMU master some time next week. Thanks for
your efforts in working through QEMU's review process, and
sorry this took us so long to deal with.

-- PMM
