Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4820123njd;
        Fri, 25 Apr 2025 23:38:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2403:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-73ff7396a96mr2994755b3a.21.1745649539215;
        Fri, 25 Apr 2025 23:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745649539; cv=none;
        d=google.com; s=arc-20240605;
        b=j7BLHYo75CT/R7vtG/EGBeqMSED/ZoFlHqhGHAo0t8b9nHQMTHDOzFag983Mrn6Bf4
         nptJceXOXLVeCjdCv8gkjNmSkWQh8vsMAAKrSO27TUioRV79uF6T0oVkcjzL3lx8FUy3
         sYJNL13Ck5mB8rRAGEFPHaOPCmAmCzyc/zWYLUWTZANBY8QYDXnAT2Lkp7MLC6hd42W8
         mv8uhGkEmFjs47APbLDWTr6uLAN4UHlRWbkBx4rrKGOTmuQ8Q2OD4vSOiEGzH8SZgevs
         Pe8kVrT+Jr9MOh5KVNLwHCn1UqDfM4R7XIDaCS7Wv+5iRVDLb2v9ALyjZBoDilE175kj
         RgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/T1LZKwySduyRo2h0IOtfFdSgYkIBmpQV9h3xYV3Y5s=;
        fh=qml1ictO63r96R772yfkUOggRS6qI9XaMn2HAjbfxJY=;
        b=ZHHKnc6oylblrABTyupRMZ7YWwme1B2qVPRydyPGDIC/rQxbOEdDDOyKBwu/vV/Vhd
         eN9EJgBzfMtG35xRgy2JFkFHOKzvaknM4nPAHixBTV7WpqCKec4eYJg+PKIZSTVzgeA4
         ZQD3LqVUXXihC3LauxBibI6WmJbAMZ00qehvxYQYuHXi+hjH+1dV3wXhs/at7at5N3+3
         xWyIxTAaY9B1+/1E0GkqXwnoDx1zvvecxIz3Iq+I/Yj3iNz29Ai5HvHp/fkJ7eZnS1OD
         eyQzT4UwZAC41YO8LJyqLPjPN7+s34HBcgnYozvI1YMumX0TBrKKXDX1h+dH2gh8eDkj
         v5/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="jws4fo/f";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73e25b6577asor3413702b3a.6.2025.04.25.23.38.58
        (Google Transport Security);
        Fri, 25 Apr 2025 23:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="jws4fo/f";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745649538; x=1746254338; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/T1LZKwySduyRo2h0IOtfFdSgYkIBmpQV9h3xYV3Y5s=;
        b=jws4fo/f5ft6eCUFYdXwjpUhN2BYiPFeKb4brQYrIYm468ulKdP7C8YKa55XqxQedK
         uvKFAujixZQqls+m7QN7oMu9022E6qBzMEjxuZHA7FLdVjR0y/hzrdzLEOGM8VljzvgH
         HdglRiLqna/YW0kyNF4vAo2wB2haI1HJJuOTFMb467UE52U11iBq2mhYDex9vsUNGlS7
         prCj8LSGFi/GHsvUGvw3g5uxBhej3EM8PAOErEC8VID8m9AOwFQ/66Sv1CJMhYToQa93
         ITjjPM593f1pfnLVc3GsFmr3Hik4aKJHJt3ST+6yEd0pEGUw2NVLd9gf24NJ0XXvccu1
         Nojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745649538; x=1746254338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/T1LZKwySduyRo2h0IOtfFdSgYkIBmpQV9h3xYV3Y5s=;
        b=U4TA59kGRsstWu5nK+fc2GBONtCaXt9Zp7vgnVGfLS8ot1WIh3aj1Kyq/yFh/2jrHx
         0j3z9d5+/ypPq/KTPIoaZtoiOvcQbnfbHSXAdsjV1XYaHOqlCAK4Pb/GHBzJvlSdy89e
         snXP1jMH6we4z/3T1U1XACea/Ql8D8h0hKaFuVbym6u+Odu4yi+IBDTCkdjmXDqHJLSP
         GLoPU8x3xNCVphZCcRjF+j/4tZh/ww9i28P7BXzkXk3gNT/zqbgJ3aDKmZ82WaJKyn6E
         BFW0H7y1Fp2SRimkK78Uu3l/YrP4Zets6ye/PKXN3vVy8ghzJyYErrJ2NQCreVrb2CtF
         w34w==
X-Forwarded-Encrypted: i=1; AJvYcCV5HCK0PL6kiPFBHjJ4MTcSOMAExxO5O0Jy+53CLfX6WuR7tgR1l8TqrKxHMjEhwBf6PWD6X5OKNIID8hDEkICDtAA=@linaro.org, AJvYcCWo6HX5PXMYayea7IdMVG9D9IDEAJxTc++/jxP65lu4eYJySr9+f752dHmyKCf6BPmMAHnq3u/8XxsHBfhx@linaro.org, AJvYcCXWALDvk4uwpeOpWAmwSnQgBkqfv42AE6/Bz9j4fm5GKKrh4geldLLVdANEMeV/84NLxDC3V4SWD83P/R6cPOz9gw==@linaro.org
X-Gm-Message-State: AOJu0YxVueB9wi5mGY6h65b2CF36EZNNiQHw0VloimAEp1V7UU5V3MRw
	f8BZ0aCeGK13lCQ4YsZw0ZSUiAJNAaBJXh5o+PAAJVapS+Hdt6Kl//wOgtXqm305niFZ28qpCLj
	LAon0rbwPI+lTOam9KV0DW8th9YRZZOoURFo=
X-Gm-Gg: ASbGncuXEKAxCU1NJQbp6zsZdhahtb+EBdIqAUQmHM8uTiF7pjQ6gF7dbCJpY3153oK
	rCSESbNmO6ws4AngYfb95ONzmaukFCh+uDJfQre2EwvBc/7Ziv90z2yhfj1oozG3biuRQ71KMfP
	3AGxOixqRQUmzt7jv7wvaLymxhX7CACXLoWTqIDhpgpa+scioP7ae4
X-Google-Smtp-Source: AGHT+IHPfSQkkpkcBFSfcIVQOJdr8vuupIRlsf58kYnTZTu9jfM8osjgQAZcyGwfjotTwU7n4se3juPAMjXfY/btnLg=
X-Received: by 2002:a17:90b:3504:b0:2ee:f22a:61dd with SMTP id
 98e67ed59e1d1-30a013bac35mr2692858a91.32.1745649538523; Fri, 25 Apr 2025
 23:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <01b21c849b459660453eb905d12ff0da4c65f53c.1745295397.git.ktokunaga.mail@gmail.com>
 <5b7afc3e-d5d3-4485-96ab-a1b212644607@linaro.org>
In-Reply-To: <5b7afc3e-d5d3-4485-96ab-a1b212644607@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Sat, 26 Apr 2025 15:38:47 +0900
X-Gm-Features: ATxdqUEudJEQciex8VkQsUG2VLwhDymMM4jg3D4EAR_WFlPPRlIFWXCgzUkbd-w
Message-ID: <CAEDrbUZrPSBezgUpVfJC8-R0ED9yLMB5YYu5e_zd9jdnd+5CKQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/20] target/arm/helper.c: Fix type conflict of GLib
 function pointers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Pavel Pisa <pisa@cmp.felk.cvut.cz>, Francisco Iglesias <francisco.iglesias@amd.com>, 
	Vikram Garhwal <vikram.garhwal@bytedance.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, 
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a567c50633a8b425"
X-TUID: utoIGgAHmjZU

--000000000000a567c50633a8b425
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> Why not use a gpointer for @d like in other patches?

Thank you for the feedback. I'll fix this to use a gpointer in the next
version of the series.

--000000000000a567c50633a8b425
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr">Hi Philippe,<br><br>&gt; Why not use a gpointer for @d like in other patches?<br><br>Thank you for the feedback. I&#39;ll fix this to use a gpointer in the next<br>version of the series.<br><br><br></div></div>

--000000000000a567c50633a8b425--
