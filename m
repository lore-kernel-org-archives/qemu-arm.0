Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp508944ejo;
        Mon, 11 Dec 2023 13:55:39 -0800 (PST)
X-Received: by 2002:a05:600c:3b8b:b0:40c:315a:676a with SMTP id n11-20020a05600c3b8b00b0040c315a676amr1905510wms.45.1702331739376;
        Mon, 11 Dec 2023 13:55:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702331739; cv=none;
        d=google.com; s=arc-20160816;
        b=HeJPJJFphgz049UeFGy65ZzspTTI3396wNMexad+PTMSOaBq3Iczvi2uiCjeN8V/gA
         7EjBMelv73rFl4zaLC2khvOZUBn7eyLr8t8nBxGrtcGKYOXCgWmpUZIFcWKZvLCecDRA
         A/baGdeq9I4TuwNMFAXWMOVLe827x/YWeymU33MsLF/ypw5ziV+IZkeslaGQFhedn9W3
         ppc3uglOYwj4NZt1bwuBJE2Jcy12uQt17EWU8O6AIN9GDlNiddRnszrvM5jDnHNu8a6J
         IYrEQntg1LuTAFqZih0nkCuoXQ8XXC9SeMw2lojvVfSgZZy8IGfSXg156gcWqpI6twVU
         xfOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Iz3Q0l8K0vTD25XA9XVhmf7f45s/h8Yij03I5Oe4Os4=;
        fh=eOqoSSwnjl5jaThnGlRW4g9uMXdn/sUszMfSc7si0fE=;
        b=tPja0hMpTbfq+A9tB387KD7ssWVsU486aIZ3IK/ex6JMUqnI+v/Hv6JcXNLnW1qrMw
         U7wp9zjjjTsuZSb0m8jPEVCX2QM283yFT3WXYu4hObTynz9iNbB+qPs9oxnpS0utRO7X
         AACXvRdxCeX1aBNIJL6zeQUSFjdCzoHYsmbgmA8wf6dPaVAiAj/hm07QLVDCB4NFaZFF
         BCLCreStokMD4RpcqC/j3iQSHo0ylFenv076QOMUgOmy+4NI0z11F4oHSkSxTrnPZ+QD
         Y8m1XlEVaioM69eVqX1uhBhEqy/K+RuPQ5OnN3ccm3zVzYSDqQ7Lk6nn/14PgKe7HDUE
         xaYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=cxMtLk28;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f30-20020a05600c491e00b0040b2b12143bsor338770wmp.0.2023.12.11.13.55.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:55:39 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=cxMtLk28;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1702331739; x=1702936539; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iz3Q0l8K0vTD25XA9XVhmf7f45s/h8Yij03I5Oe4Os4=;
        b=cxMtLk28ClA5U1QRABFFf/U/YLHOM8eElSk+3QNhWF8TzoeQkC2dixjcLdGhXiORyJ
         ApVBaL1wjHYP0f4/EzfOZqo8x6jVMQUAbeh8NNK12FnBmDnFpB4wO6ntAKde3ZNWqAQk
         Ui3+MW1yA9J3rhlLe1VORunku6uTdklSBvzcQtECjf0PdvA+zknJggXVUhwNyDE+otoW
         f2nDyB98Gvr2AwfvShRRkPSTFSzcuuequLJNglgaGOxrCxwoKlFWQ81PDEooUicuYmny
         WnoquqzZ6+JN3RQmoA9KW3mCd3VIeELSUkXWOxKFIGUvt8vjz1l8NWKCOTQw0QnOFoOw
         74/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702331739; x=1702936539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iz3Q0l8K0vTD25XA9XVhmf7f45s/h8Yij03I5Oe4Os4=;
        b=etCg8bhr6JJevxEJ7MEXOQGB8b7arwsG2G0Ky1wygiKk+mVhlK84uLV48Zpspw00Th
         JvIY5SlzDLKjVOpxmUK23h1l/STCBWLfNP3ZkJ0KD4p5BSYj5KNdgfDl9JHXIms++Ydo
         2EaPGDBi/YRDUknmamqOzBWsRrMemUX76O6p+XrgatkmS/2OFfXixH4HiW9Y+iIAZvCK
         iYuQTRHQGFa7T03b6UdlNiMGux7hoNOYe/apDT0cs14fAWUKc5UTsQ3cb75D3Xd4PXxn
         dkAYOzfmk8EV2qj/+1w+Svu3Ojj6oJnwJzqtk/cNbcxuIK+RlH61W8QnTJALkIjyG+qa
         baVA==
X-Gm-Message-State: AOJu0YwO018aV3HeWkVxv18l1Lq2UtRMUh+JzHtQA9bLGRe36Tn0cxZB
	tqn68d326GkHPAukZ8oTnAV4wJwx7THU7rRVjvf57Q==
X-Google-Smtp-Source: AGHT+IH2J60t4jgWjWsmDAtxC/wWNmQPmde2ThAQ76FDH5GLoHt5faxYztbGpy6XtMX/EvcjBT9D2Wy+uQ8hAhEroZs=
X-Received: by 2002:a7b:ce13:0:b0:40c:2307:e133 with SMTP id
 m19-20020a7bce13000000b0040c2307e133mr1859225wmc.168.1702331739033; Mon, 11
 Dec 2023 13:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20231211212003.21686-1-philmd@linaro.org> <20231211212003.21686-2-philmd@linaro.org>
 <CANCZdfppY0D1HOBN-n1h9ZQUHSK23YVgewn-vcRAQTs6--TCzw@mail.gmail.com>
In-Reply-To: <CANCZdfppY0D1HOBN-n1h9ZQUHSK23YVgewn-vcRAQTs6--TCzw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Dec 2023 14:55:27 -0700
Message-ID: <CANCZdfrc1RYKotcYhJLKZamh95K=CcbYtwuuTrrvt9wuJSuG9w@mail.gmail.com>
Subject: Re: [PATCH 01/24] exec: Include 'cpu.h' before validating
 CPUArchState placement
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>, 
	Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000986994060c42fe96"
X-TUID: G7BpFAUtutLt

--000000000000986994060c42fe96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 2:53=E2=80=AFPM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Mon, Dec 11, 2023 at 2:20=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <phil=
md@linaro.org>
> wrote:
>
>> CPUArchState 'env' field is defined within the ArchCPU structure,
>> so we need to include each target "cpu.h" header which defines it.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>>  include/exec/cpu-all.h | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
>

Brain f**** I meant:

Reviewed-by: Warner Losh <imp@bsdimp.com>

--000000000000986994060c42fe96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:53=E2=80=AF=
PM Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:20=E2=80=AFPM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"_=
blank">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">CPUArchState &#39;env&#39; field is defined within =
the ArchCPU structure,<br>
so we need to include each target &quot;cpu.h&quot; header which defines it=
.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/exec/cpu-all.h | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br></blockquote><div>=
<br></div><div>Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.=
com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div></div></div></blockquote=
><div><br></div><div>Brain f**** I meant:</div><div><br></div><div>Reviewed=
-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&g=
t;</div></div></div>

--000000000000986994060c42fe96--
