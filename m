Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp632071njk;
        Thu, 17 Apr 2025 02:08:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2741:b0:301:6343:1626 with SMTP id 98e67ed59e1d1-30863d257dcmr7295374a91.1.1744880891384;
        Thu, 17 Apr 2025 02:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744880891; cv=none;
        d=google.com; s=arc-20240605;
        b=GOl2oBmxunDnQTqgBIYT0KRvuOmX339iy912iVrM7rCyH4TKU/WQIuagZ0VZQoQBAn
         3HEeuaOtxlpDyj7tqXUs4oMhdAkssP0kSKbe2x3FLWSU35+TZ+20KclAaGiGinW8MjMb
         H4pcXwRvB4f2AvRo3byOFtU+5EoBdTFWVt2sP2Wufq6bsH+YHqWHX/rme80Flq55wLt/
         IXRHRC72HjAAuOJkU4N/b7OuGiFlItZSNQIAfUcU5VocLeuZH82eHCQxCLPFVgqXvStd
         sH1pvQ36QqllPDRHZuzNWM55J756xip2Bu298GIMigxznhLMlRxsYiMN1olEQEeRIaj2
         fG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RX6RdA2ZPdP1x/dP/QkgTF0/lqZSn71J8irkE5U7t9k=;
        fh=YPpWXZkaXypph6ccdrOAHkKlOi5k9JqgeaI7jzsMFWg=;
        b=TkrSz3KlTOvrHl6RYCLEdwj92n+v/yyChaCyvEQdl3rR2loj0V8eBtlUPJd1h2TDZJ
         nLEoCy6y+grZBOgJwnVa89eU8eZ6t/bFA6HMrr0nSFMWtuhbgtorl1aNBYk/uMGGuAei
         szEF2+UJx3v5UaK7EiPmixr+pxBNgLYn7l4QriTzFEXJ7eWCylm3HXnU2ai9wuHQ4ZI8
         vaqvZBXQiiZo1c/OE1T3UmHemgT0SPEUyUuWcilDsQw+9fsrCnFf75vVuTVpwIQPAPNr
         84MhqFlnlVl/LFbwPTvkXC+jJ1HDh59eTd80l+ECndMlncy4LpTKiHokHcHU9VktjE6R
         rg2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iHzWNtOU;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-308186a4b4asor12763622a91.1.2025.04.17.02.08.11
        (Google Transport Security);
        Thu, 17 Apr 2025 02:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iHzWNtOU;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744880891; x=1745485691; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RX6RdA2ZPdP1x/dP/QkgTF0/lqZSn71J8irkE5U7t9k=;
        b=iHzWNtOUENsSmjQ9cmSgnKWVb48cdQyUOXadNMPFZz2Gt4kwYiG8JGoVRKJgEG52Ag
         sYMlkrrQJnLg5zoV6kCKu6lG9feaSioJiKltObOECKcX3LagGYezZBnaKNZqZkrqTfhg
         WyIUOXMKhcUw5NJeaHp4Kb0jVgAa/20VkQjjYLe/mjqdBz2JcFbdA3kNdqR0NgX/PgyR
         tSkgT+iepMnENHLPQHM2UpPwPPvpBCgfd7P1OtTDODgs1r9py4DXt8U6KyMzIxapZBB6
         IO4SSKeyhjzga4m7xHWXtMf9ZR6/pB5BZKev2OJo16mWyLKJxydy6t7WavSsuS2siR6M
         3EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880891; x=1745485691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RX6RdA2ZPdP1x/dP/QkgTF0/lqZSn71J8irkE5U7t9k=;
        b=qL9n0tyyToQsxT0mnYr14NE4A/psgYN5UHQKEcHvpslzzLQ+vfhsmhVgUuyv1+vZ1G
         uovsa4Cj8fSjMIYkWS5caP5IJbkF7iaxaF34G5oeZ4pEytjDHValLD/fntsSPbm4YpO7
         QL5XfgvSLx232Y87DS3K5SKBMloyKHoWWk7YkNEsmwr8ab6X7/ajUKB82Ds+U65FoR3x
         EF//HKreRBLIaLCMPs3EPA/rmcwLvllMN7PoG3G863oU2/jaVmcTjk/qPtfQs/vyLrC9
         iMQevhLw1ih7caucR92VlLGs2mMZ0kPqsyN8zJ8BaNvFkYKJCPwwHGit+hWIB1hCCfyh
         W4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGGz5mrgIae9T5neZHQTs9fiHCwoyvsYJ/xailC1p8ZLpw2ek7oxzVJ6bxA4iqtgMSWhYkzFU/+q2ucfqy@linaro.org, AJvYcCVHJ9f8dwblt0GFosW8lnsNTZJjs+rlDTNOEpcWl1X0/hk0DnQuA1Z3dYGQ7XHHNiLhm6Jtvzxs6O+4XNOQtr35twc=@linaro.org, AJvYcCVXoLPl/GMp+iC1/Om7poJJGZyeauUdLBplmsO8bhKBtZUW8iJOwezJbDmN2Llx+8Gu1IluTQXo@linaro.org, AJvYcCWEWotS6aGNh02O1iQJJAkfsIuReSCiFnFVYL37V3/864qEREngS5L5XUqZLlC9A3Z831mzwvfrZebdFoNUe9Uosg==@linaro.org
X-Gm-Message-State: AOJu0YxbprWcAxQ/eXNqTM5L4Tx+RJkQEiOoC+NzZAeepgjktJ2/N+oO
	ohr2k2lOBuwqFksw5u8tMsNaQBtyP7jHtQMTNnLs1pMxTRTZxhVKnZOT7v35NmrveB0Rvs8tSD9
	PpK4pNDk35yo6WctToIayF2+hvFPqCOVw/2A=
X-Gm-Gg: ASbGncvoT0bBXkqPZ73UE2Sz/X/YnDoYQ93mxlu+IBLfktGpENIIWtWl1EaXVHN2FIq
	J2qpBueM8rmfih2UtcVqcQs33yvLTmRE96nfFhaIH79bNQ0Yp6Drk5LXSkP4S9a/YyPl5dd6KgQ
	gSvGGVSsVx8ig+Vq5w8x2Mz9LtipmakhQ2mm611M3GneuWqaVos8VnCCq5jlqdrys=
X-Google-Smtp-Source: AGHT+IErs/6yr7NvmcQpzRNkUCEqx5sl1VpdkRX4//FuoykcHO5spdFERVti8OBP7SHlu/UrylXSXdJOlZ0WZjUnhME=
X-Received: by 2002:a17:90b:254d:b0:2ff:6fc3:79c3 with SMTP id
 98e67ed59e1d1-30863f1b878mr7991510a91.9.1744880890768; Thu, 17 Apr 2025
 02:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <44e9ef95ea6e8aa33560ca8580db0033623f0e91.1744787186.git.ktokunaga.mail@gmail.com>
 <Z_9qIQhjsI5zOwXA@redhat.com> <3b661309-904f-4670-b5c4-d537a4745c20@linaro.org>
In-Reply-To: <3b661309-904f-4670-b5c4-d537a4745c20@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:07:58 +0900
X-Gm-Features: ATxdqUGQszfJtE52WkySPK7Za_X9zCr63jfmUjXigIWcEzfc2LINVQp2bunB9YI
Message-ID: <CAEDrbUYOBF4QoTCR=JfaV2B33oHeKkL6cMxc-rSmzpZHyhi2LQ@mail.gmail.com>
Subject: Re: [PATCH 01/19] hw/core/loader.c: Fix type conflict of GLib
 function pointers
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Pavel Pisa <pisa@cmp.felk.cvut.cz>, Francisco Iglesias <francisco.iglesias@amd.com>, 
	Vikram Garhwal <vikram.garhwal@bytedance.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ab74ed0632f5bd1e"
X-TUID: sX/8ol5+01C5

--000000000000ab74ed0632f5bd1e
Content-Type: text/plain; charset="UTF-8"

Hi Daniel and Philippe,

>>> On emscripten, function pointer casts can cause function call failure.
>>> This commit fixes the function definition to match to the type of the
>>> function call using g_list_sort_with_data.
>>>
>>> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
>>> ---
>>>   hw/core/loader.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/core/loader.c b/hw/core/loader.c
>>> index 2e35f0aa90..93a8b45d28 100644
>>> --- a/hw/core/loader.c
>>> +++ b/hw/core/loader.c
>>> @@ -1410,7 +1410,7 @@ typedef struct RomSec {
>>>    * work, but this way saves a little work later by avoiding
>>>    * dealing with "gaps" of 0 length.
>>>    */
>>> -static gint sort_secs(gconstpointer a, gconstpointer b)
>>> +static gint sort_secs(gconstpointer a, gconstpointer b, gpointer d)
>>>   {
>>>       RomSec *ra = (RomSec *) a;
>>>       RomSec *rb = (RomSec *) b;
>>> @@ -1463,7 +1463,7 @@ RomGap rom_find_largest_gap_between(hwaddr base,
size_t size)
>>>       /* sentinel */
>>>       secs = add_romsec_to_list(secs, base + size, 1);
>>>
>>> -    secs = g_list_sort(secs, sort_secs);
>>> +    secs = g_list_sort_with_data(secs, sort_secs, NULL);
>>
>> I don't see what the problem is with the original code.
>
>IIUC the rationale is in patch #10 where Kohei poisons g_list_sort():
>
>   On emscripten, function pointer casts can cause function call
>   failure. g_list_sort and g_slist_sort performs this internally
>   so can't be used on Emscripten. Instead, g_list_sort_with_data
>   and g_slist_sort_with_data should be used.

Thank you for the feedback. As Philippe pointed out, the rationale is
explained in the patch #10. I'll make sure to include the explanation in
the commit message of this patch as well.

--000000000000ab74ed0632f5bd1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Hi Daniel and Philippe,<br><br>=
&gt;&gt;&gt; On emscripten, function pointer casts can cause function call =
failure.<br>&gt;&gt;&gt; This commit fixes the function definition to match=
 to the type of the<br>&gt;&gt;&gt; function call using g_list_sort_with_da=
ta.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Signed-off-by: Kohei Tokunaga &lt;<a hr=
ef=3D"mailto:ktokunaga.mail@gmail.com">ktokunaga.mail@gmail.com</a>&gt;<br>=
&gt;&gt;&gt; ---<br>&gt;&gt;&gt; =C2=A0 hw/core/loader.c | 4 ++--<br>&gt;&g=
t;&gt; =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>&gt;&gt;&g=
t;<br>&gt;&gt;&gt; diff --git a/hw/core/loader.c b/hw/core/loader.c<br>&gt;=
&gt;&gt; index 2e35f0aa90..93a8b45d28 100644<br>&gt;&gt;&gt; --- a/hw/core/=
loader.c<br>&gt;&gt;&gt; +++ b/hw/core/loader.c<br>&gt;&gt;&gt; @@ -1410,7 =
+1410,7 @@ typedef struct RomSec {<br>&gt;&gt;&gt; =C2=A0 =C2=A0* work, but=
 this way saves a little work later by avoiding<br>&gt;&gt;&gt; =C2=A0 =C2=
=A0* dealing with &quot;gaps&quot; of 0 length.<br>&gt;&gt;&gt; =C2=A0 =C2=
=A0*/<br>&gt;&gt;&gt; -static gint sort_secs(gconstpointer a, gconstpointer=
 b)<br>&gt;&gt;&gt; +static gint sort_secs(gconstpointer a, gconstpointer b=
, gpointer d)<br>&gt;&gt;&gt; =C2=A0 {<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0=
 RomSec *ra =3D (RomSec *) a;<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 RomSec *=
rb =3D (RomSec *) b;<br>&gt;&gt;&gt; @@ -1463,7 +1463,7 @@ RomGap rom_find_=
largest_gap_between(hwaddr base, size_t size)<br>&gt;&gt;&gt; =C2=A0 =C2=A0=
 =C2=A0 /* sentinel */<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 secs =3D add_ro=
msec_to_list(secs, base + size, 1);<br>&gt;&gt;&gt; =C2=A0 <br>&gt;&gt;&gt;=
 - =C2=A0 =C2=A0secs =3D g_list_sort(secs, sort_secs);<br>&gt;&gt;&gt; + =
=C2=A0 =C2=A0secs =3D g_list_sort_with_data(secs, sort_secs, NULL);<br>&gt;=
&gt;<br>&gt;&gt; I don&#39;t see what the problem is with the original code=
.<br>&gt;<br>&gt;IIUC the rationale is in patch #10 where Kohei poisons g_l=
ist_sort():<br>&gt;<br>&gt; =C2=A0 On emscripten, function pointer casts ca=
n cause function call<br>&gt; =C2=A0 failure. g_list_sort and g_slist_sort =
performs this internally<br>&gt; =C2=A0 so can&#39;t be used on Emscripten.=
 Instead, g_list_sort_with_data<br>&gt; =C2=A0 and g_slist_sort_with_data s=
hould be used.<br><br>Thank you for the feedback. As Philippe pointed out, =
the rationale is<br>explained in the patch #10. I&#39;ll make sure to inclu=
de the explanation in<br>the commit message of this patch as well.<br><br><=
/div>

--000000000000ab74ed0632f5bd1e--
