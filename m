Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2827614njd;
        Tue, 22 Apr 2025 23:01:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8b:b0:2ff:502e:62d4 with SMTP id 98e67ed59e1d1-3087bccb0d8mr22099574a91.32.1745388104198;
        Tue, 22 Apr 2025 23:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745388104; cv=none;
        d=google.com; s=arc-20240605;
        b=gmwowTqAoN5WP7W9qkM9bj8xlm6lGoQZfyXoxMvAw/EYmWOf3H9BjvYTmZbexgFbf0
         A/Wu1Q/Z4NIlRBmj102o345JAT79TvfJZWPpvW+WXsxTuxYPVaFw2S8ixW5Ob/op7Slj
         96NFFhax2N+BJeIfMcrcRZKZtzym1PmvHSKofZexK0yyUr4R6tLyey9NdzysUtPR/zER
         9JdxHZD2NS7XbIZ9iIh4dAWou6wxAaBP3dibzf3XMViJBfK8at+L6HTfIEoQ5kALMh3p
         LaPsqFQ3Ik6aYbkRbRj8yclVwb1tHCCGBtDeL+eqlzctBi4zpG0+cqMJannc1y8631Dj
         HtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75V2zUF4G37A+7ojkne1bi0Ew25Suvv6XvzMaaSL0es=;
        fh=QyN4MfWE7fI/6ejWR7rOotfoL7x5In4pdDzSa7I5H+k=;
        b=ZNwadBD+Pv8+TrAiDeMUA3hDbnHPSE8tpMs/FFz49yJRdI/rFJXE77RyzIvqbgEaps
         QR7b035Z8z8hF7+wXsxJZBOCH5FYHBRB6YwUaXZgO53lVce5pUVbxBog8ye7DtQSxrMD
         qiuusuGmpzYOuyzGlfMS+ZRUoRPflQSVskUvsk/v4CkISn00QLfZ//YMg7py1fmjykQx
         RpKzSYm318covCvFuabj0NfOncDGSFUMSLy2f9+cDR5gebupjeB69ZoL4FnUURjOZp8Q
         y6XIQdxL/4AkywLoi+g/P/AgMwQ0Ey4Tq8LmegiBYl3mcUp0xs7Za/puHmqrkL3XnW0Z
         5LVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fW3GhVz1;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3087a703020sor7471291a91.6.2025.04.22.23.01.43
        (Google Transport Security);
        Tue, 22 Apr 2025 23:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fW3GhVz1;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745388103; x=1745992903; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=75V2zUF4G37A+7ojkne1bi0Ew25Suvv6XvzMaaSL0es=;
        b=fW3GhVz1zv3LrC9VGmxQQgVM8xBw+Ey4wEZf9SWDgVRFxqXVWGxnmakInVKPNz6eCn
         QYwHmdcrBV2Z6WBaT7qPOBXrfTcnvsRMhZKvMUUZmaLm+5RnooHZZqwfXbJioh6/jWl0
         0i3l8mmtqh3Rfa6jt0wYo6pgWGxgBn/skm7PYBPczYlSvpUigm8/pVbwrQyk1ELl3EfB
         Q9hYls6RSVNJUJkRhtESpxL5R83bJYbcboImESdQ6x7ASn5kUvFXlzgi6GkbeWgQ3Tbl
         4QBUppjweJ3fuOy7lEY0F0eDfS4E8k6g+Yh+UmWpS3200bH1qmi1MzPZPGmqMQtbUs0t
         95vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388103; x=1745992903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75V2zUF4G37A+7ojkne1bi0Ew25Suvv6XvzMaaSL0es=;
        b=Wsmk8ojas2gQTpsqaZ1X4iEgow5LFodhvlcSuMLJciD3j927TYvLSb/HKskH76feoR
         RZz7JM0BCC4bxq03MPdVxk+OUtmB9hk6KxwNABDwd+meFwxGVTA630dWvkF4n/fueAJe
         qJr0bb26KqjiOxL1Fm7H7Njo019H3obuiFold018c4t2tLs0zsfpkte0aiG7it36csO4
         ZGXCoHH1sY1uySq+1vBFI9gkW4YbsJOKhBuWvoP1v5ddJXCaRamrTllA9O1xCxr0UFDt
         1UrRfXh5/af6BqpIs/PtdcAc1adU//vgvkMl1a82EIcdUqxGLJH44CaNyxGdZn83sx2C
         VI1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYMBlgAfPlksjcT5YqQ4MVpXYQZflpFkcc3myVrNG0pSz3xNpvN26Lra+jOZsDJuLbGjr4Em6o87BYIuS0UTJFsA==@linaro.org, AJvYcCWuUZKnXEdWk3xQJSiws8oMf4GLVKB7YfpvjxwHY4pXdT54euUN8hMMBcumQWRRXiqsU3NCuHKFway9sH5x@linaro.org, AJvYcCXA0eVymDIP2NS+R/OF08II0yJvHaJdnWWO9lkd9GRd/3qR484XPJZ5926tmPc5KSVcxZexMd+abMgehXeMmDLFPv0=@linaro.org
X-Gm-Message-State: AOJu0YzwTLLDStW0fLx7Dj6gwtAtJvO5hvQCvIZsJo2+d5bDXRVke89/
	JgJwgiPm3G5ash7wUSzj4iYhUrJYHMfa6k/eTV1RadGoqo3h+cMLrmd3p+qmeo9MHgK0zVxExmi
	x0qh6bMkMlbwh/RKha6i1hwzfsUWZlnL07aQ=
X-Gm-Gg: ASbGnctr6SNUW83xDsKAfpfJiiHiGdtVfQoqHbFTX68XjS78ovC2imsU+VvnNwsz3aq
	hC74W/9MdZBnS1qokBsMbHlT7xWw9PejyObiK3R5PUn+P/uEKSS/8cJJtFWWIWJg+n5A3LVAqJk
	0+XbluaI2X+d1jW177rzK1lQuLqFpNvUM2lcAsC1yCDtAOZxJUyeXSw+MLGQ3+VKM=
X-Google-Smtp-Source: AGHT+IF64z5wKPzTJg/n9OD0eLWYp+yiZBMBwrvB+l+qjOffdfHgzpWEL7Jo3pzSu4UBC4S2i0z4JhIyxFME2Cwj1Qw=
X-Received: by 2002:a17:90b:254d:b0:2ff:62f8:9a12 with SMTP id
 98e67ed59e1d1-3087bbc2a72mr23062304a91.23.1745388103371; Tue, 22 Apr 2025
 23:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <73301cc216217d5c3e0d7acdd32482e36f4f045c.1745295397.git.ktokunaga.mail@gmail.com>
 <e163300b-307f-46d9-9bf3-10f17c998e78@linaro.org>
In-Reply-To: <e163300b-307f-46d9-9bf3-10f17c998e78@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Wed, 23 Apr 2025 15:01:30 +0900
X-Gm-Features: ATxdqUEgMiBMXQqp1DS_p2pUXzotO2Zb8dScDj2LI8F234aM8mnRYFR9cYzrLXk
Message-ID: <CAEDrbUZkh6P8y8gSf9jcJSYwBDGVYY-dd9EYhcFtEHFUVqV0UA@mail.gmail.com>
Subject: Re: [PATCH v2 11/20] util/cacheflush.c: Update cache flushing
 mechanism for Emscripten
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
Content-Type: multipart/alternative; boundary="000000000000e5a29306336bd5c4"
X-TUID: CsLJxz4Ad7dH

--000000000000e5a29306336bd5c4
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

>On 22/4/25 07:27, Kohei Tokunaga wrote:
>> Although __builtin___clear_cache is used to flush the instruction cache
for
>> a specified memory region[1], this operation doesn't apply to wasm, as
its
>> memory isn't executable. Moreover, Emscripten does not support this
builtin
>> and fails to compile it with the following error.
>>
>>> fatal error: error in backend: llvm.clear_cache is not supported on wasm
>
>Note, you mix LLVM error ...
>
>>
>> To resolve this, this commit removes the call to __builtin___clear_cache
for
>> Emscripten build.
>>
>> [1]
https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005f_005f_005fclear_005fcache
>
>... with this GCC documentation:
>
>   If the target does not require instruction cache flushes,
>   __builtin___clear_cache has no effect.
>
>I'd expect __builtin___clear_cache() to be OK, having no effect on a GCC
>WASM implementation.

Thank you for the feedback.
Although Emscripten supports built-in functions using GCC-compatible syntax,
the corner-case behavior looks different from what's described in the GCC
documentation, as shown in this patch. To avoid the confusion, I'll remove
that link in the next version of the patch series.

--000000000000e5a29306336bd5c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe,</div><div dir=3D"ltr"><br></=
div><div dir=3D"ltr">&gt;On 22/4/25 07:27, Kohei Tokunaga wrote:<br>&gt;&gt=
; Although __builtin___clear_cache is used to flush the instruction cache f=
or<br>&gt;&gt; a specified memory region[1], this operation doesn&#39;t app=
ly to wasm, as its<br>&gt;&gt; memory isn&#39;t executable. Moreover, Emscr=
ipten does not support this builtin<br>&gt;&gt; and fails to compile it wit=
h the following error.<br>&gt;&gt; <br>&gt;&gt;&gt; fatal error: error in b=
ackend: llvm.clear_cache is not supported on wasm<br>&gt;<br>&gt;Note, you =
mix LLVM error ...<br>&gt;<br>&gt;&gt; <br>&gt;&gt; To resolve this, this c=
ommit removes the call to __builtin___clear_cache for<br>&gt;&gt; Emscripte=
n build.<br>&gt;&gt; <br>&gt;&gt; [1] <a href=3D"https://gcc.gnu.org/online=
docs/gcc-14.2.0/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005f_005f_0=
05fclear_005fcache">https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Other-Bui=
ltins.html#index-_005f_005fbuiltin_005f_005f_005fclear_005fcache</a><br>&gt=
;<br>&gt;... with this GCC documentation:<br>&gt;<br>&gt; =C2=A0 If the tar=
get does not require instruction cache flushes,<br>&gt; =C2=A0 __builtin___=
clear_cache has no effect.<br>&gt;<br>&gt;I&#39;d expect __builtin___clear_=
cache() to be OK, having no effect on a GCC<br>&gt;WASM implementation.<br>=
<br>Thank you for the feedback.<br>Although Emscripten supports built-in fu=
nctions using GCC-compatible syntax,<br>the corner-case behavior looks diff=
erent from what&#39;s described in the GCC<br>documentation, as shown in th=
is patch. To avoid the confusion, I&#39;ll remove<br>that link in the next =
version of the patch series.<br><br></div></div>

--000000000000e5a29306336bd5c4--
