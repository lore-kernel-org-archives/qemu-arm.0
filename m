Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp707526njh;
        Mon, 12 Aug 2024 02:29:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtCaNw8wh5bSMMH3X9KPPXphJDauPAQKUO9ib8emMzX0BdkminPnCMlI6J6I1SH+acvwwtnquA33lC9A==@linaro.org
X-Google-Smtp-Source: AGHT+IH9U6N/rE5CtODq29cgOw8hQiO19KZGvr+ETc5Tboa4HX51i5UTmLprQY7oF2aC2NO8AX51
X-Received: by 2002:a05:622a:6105:b0:447:e636:9ea4 with SMTP id d75a77b69052e-4531296cf12mr115961871cf.8.1723454997790;
        Mon, 12 Aug 2024 02:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723454997; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8mh7Wqv9KmPw1yyFHMwgF8xyl3VNLfDCEdC+K5MCYvFSrbJCuvI5mHxJv2y+qjSJi
         /yBY9PlbXlm4TjHtNSK06CvBM9VaEx5K2PzbzKt6mz/6U2JmQntouC6ZmfTzf8xYQk9y
         vIcAOwg69jvJyaBTpi8yivjLJxruCwQGqXFSiB5ng2T5TLgfC5E2+R1i1+/EO5QxqbPS
         fcQXJK1/pk1Uy3ae7bmSIG7AMKkuOx0LKFNphNYijb9ca1+QQxda51sZQs8VyDTp4ouo
         2Y0GT7LkSuFpeGvnZuMnMst1IH25XsPZN0KTeWXxFegdS1lr3R5WqFj7Rh1KfX3HkOjk
         ftYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZatMmrClv0aTLwZezj5tD8JVw5xv2o3tcbRjXncUC30=;
        fh=WPiK5Cchx0HZ3OAbFyl3XkTLT95liZTQRuYSREqJb8k=;
        b=c6Co4NK1ab/Kib2+QK4zRqMFTbiVfRPW6wdHiPkw/AwyIedoh8l9aj5W1b8lHpzIRJ
         6Da8rR4wZ4RG/miwg3L/gFzx8ddCrvwNZ79AZsasi8/4DoClvhFqRzM2vI7QumO9CzHi
         eG7TMm8Hwmf7WWWIs6LF9+iAaurHCKEUPIwhTdLMhz2NtcNP+wODYeNjWUbj5ACyMaBX
         aoca5D5nAY0rGdg29x5M64wkZOOrlGfhYzikl36YPWJmFA6GToWsWPK1RbMUJVBVrQZR
         CQwRUGZlIkaJQ0xR0h1GVu0NnPFjMWOCWy34uEN3Cng//zScucWSAUtz1Axv6D0ZKoJV
         bW0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZXNSSIKX;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c2ca8e4si55174051cf.803.2024.08.12.02.29.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 02:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZXNSSIKX;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723454997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZatMmrClv0aTLwZezj5tD8JVw5xv2o3tcbRjXncUC30=;
	b=ZXNSSIKXISHrDl18eoWZUSsJCWhRgYIDtDCMXHlz/fFSo7Gygpmwpinbxkhmkhr1STr3j+
	Mf4mxfsRWo0PHjt3M4RzrPcvPGZF6Y637zLrIqbz2Cv9/i4MbJbOG8cX4za/+N4WuTO3X7
	3A5V9dDjgGb0x5FlNs9DZ42LS1GmX4w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-Wy2WvK0NMCuVLCaiecvBZA-1; Mon, 12 Aug 2024 05:29:56 -0400
X-MC-Unique: Wy2WvK0NMCuVLCaiecvBZA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3685a5a765fso2504600f8f.1
        for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 02:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723454994; x=1724059794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZatMmrClv0aTLwZezj5tD8JVw5xv2o3tcbRjXncUC30=;
        b=iyS6gIga/3ISGLtzndLc81jjmZ34oVHgIVNbzk/IwUKIe+rt1dJgOmy9oiWbM3U5+Y
         JpWRl8o6llbUCywLo5Y+rUv02IX7p2VLg7Xq3epbVufIdXVK7iRTz9lZZq6O/rVAl9fH
         XlF4Iw+AuOBF+aUfXtAt25zjOgCcWHXALtclQ0I/bkAOInte9LOGB+ZNSaY0suVO3cg1
         lvygQRd8FhlLoGRlGG7xbFypAh/jvgav+lOIsCqDd+DtWweCqQGTcoETMc6HbQTkWByp
         bd49EGcdrgb8vBQ/oFXXkpXEO5O+ZpgKguvUt6DvvF5L7qP7Z5Rae2i1oBB00BRs4NrL
         YDOA==
X-Forwarded-Encrypted: i=1; AJvYcCUcM6n3FTWUDAc2BBaNLPqBYVhtyYuwoSRlReHbL4m5qqW9O/cdk86LIPpVi0BrTUj1Lf3PW4r+idGTRg==@linaro.org
X-Gm-Message-State: AOJu0YwHJ/CVOROaUL+dkRKBN26TIlUshzZ61lm9O2ZLC+MxrEqTnY1Z
	Vbmui8/0s8WJd+qVIZ/exJRKL+GiFwuSmurDloAVyW7bqVziivnYqmJgXutla0EuGz7R4qcyj5a
	k9m7K+Splns6PUP0to0JTWN11PDJkGfDEvaywjLo6Mr1KAEXmfvcIkH1Ff2DLNiycyESSTSTk/1
	Q1Ul+q/j9cpqhPvt1cw6STiyE2VhdZ
X-Received: by 2002:a5d:6845:0:b0:367:9624:f369 with SMTP id ffacd0b85a97d-36d5fa9e7a4mr4852465f8f.16.1723454993888;
        Mon, 12 Aug 2024 02:29:53 -0700 (PDT)
X-Received: by 2002:a5d:6845:0:b0:367:9624:f369 with SMTP id
 ffacd0b85a97d-36d5fa9e7a4mr4852440f8f.16.1723454993450; Mon, 12 Aug 2024
 02:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <rust-pl011-rfc-v6.git.manos.pitsidianakis@linaro.org>
 <rust-pl011-rfc-v6-5.git.manos.pitsidianakis@linaro.org> <9a83a260-4f4c-477b-a6e1-c8d78d1f3039@redhat.com>
 <3891718f-2f15-435d-a7de-cc40492374f0@intel.com>
In-Reply-To: <3891718f-2f15-435d-a7de-cc40492374f0@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Aug 2024 11:29:41 +0200
Message-ID: <CABgObfaKcMy8Y_HXL+s_8Bpz_UoV3Md+rYvbHdJHEGDiDd1sQA@mail.gmail.com>
Subject: Re: [RFC PATCH v6 5/5] rust: add PL011 device model
To: Junjie Mao <junjie.mao@intel.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Mads Ynddal <mads@ynddal.dk>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Gustavo Romero <gustavo.romero@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, rowan.hart@intel.com, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: uoqddz+Kq4Fd

On Mon, Aug 12, 2024 at 10:51=E2=80=AFAM Junjie Mao <junjie.mao@intel.com> =
wrote:
> I tested that branch by a cross-build to aarch64 on an x86_64 machine (wi=
th
> "./configure --cross-prefix=3Daarch64-linux-gnu-
> --rust-target-triple=3Daarch64-unknown-linux-gnu"). To configure successf=
ully, I
> need to add "native: true" to every "dependency()" that refers to those
> dependencies. Also their "override_dependency" needs a "native: true" as =
well.
> Here are my detailed changes:

Great, thanks for the testing.  I applied your changes and also
removed "-native" according to your suggestion.


Paolo
