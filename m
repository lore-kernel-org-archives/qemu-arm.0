Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2547298njc;
        Mon, 18 Nov 2024 04:40:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHdqQO4jV76CTVrhHp0uzc2rjIMhKjqrL5dQMWxcRsmhDe6COpFsiLts0pA6jc3dzD5a9r
X-Received: by 2002:ac8:544f:0:b0:461:17e6:2650 with SMTP id d75a77b69052e-4636b0d6ec1mr117690331cf.14.1731933648665;
        Mon, 18 Nov 2024 04:40:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731933648; cv=none;
        d=google.com; s=arc-20240605;
        b=aMu5SJ3RLs5LL5rD2/nnxUaz+VLOL/r6felLQwai1q+5YvfLYf1x2CPbDkephHO+GN
         qnGlSyb5wtBQomQB7CTJTIzv3GXti1QOM3UJd0Ls4pOOXqsJo82T10LELobjsZuGaQSK
         JS8c1BS0z//Ad0LZFfPlTNNxyQAw3GQuuYYZ8QXRY9Er0sMedxUj8bER7mBBNDsxW/lW
         soiOfHqRhDJ6OAFEF6oAk2El0q5MBaK+MhO55wXmCEaH8a+TokQ4X0l3jSTIOvIELWxA
         u/ixnmlHtinZ7jjzL/LUFWGtnt3ttbAJ+Z3RCgF4eYXPRIEd0Rz/5jLc9SSFSvOoXeRS
         TMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Ca0cxM3UlWVse/L3ofROZ5zzW/nq8lsxvLIZ+MdO/Y=;
        fh=xFxz7OY6HI48SAWowo6vhBpVUwtKk5JWufzA4iLGjLw=;
        b=O98c1fBjIsfvylmpkC/TiLBTTSVTHpw952tCgi6lva105Fll9OUcwr96PW4QyOZ+GU
         DP+wG0zubi6pvukuUgWGiMv5AppxhvkNDvdFEUe+nSNgRFZ/RCRa8p1cRtS0843OPPaE
         TT6f8erEthSwGzuq67EMZ6EXkIWWMX5rV79GW97nZHbSw3CbuxtFBtz/b6U1KVDbKkRT
         vGD+8BPuqiv78LySypSDwsmoYZz1HgkuuVmNZvsCVe6o2plYljGcjDrWNYrK8jjjq5dv
         Cft3t4s7q9pc1J20S4YkivuaIHl75HoQJz3bodyd3dkj/mRxJDPgv1hwYRGs6Jfks3fQ
         Wq1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X5XlH7p1;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4635a989c9dsi104343221cf.2.2024.11.18.04.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 04:40:48 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X5XlH7p1;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731933648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ca0cxM3UlWVse/L3ofROZ5zzW/nq8lsxvLIZ+MdO/Y=;
	b=X5XlH7p1zO7xzSes3cs/r3fwUhyyofcGE+lyxwCNIHzywRi2JX1WnfgIgngRzL5TySsHld
	tUAQWLHGazDVU+EvCTdd9BJoNjFGZ7WFlQPlCB2Zq5MY2vIN7UYnRf1mujm4sNh2MS60qe
	M4QdVkEQtpETTtOhqiar0CnvkZAWqPI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-s_hx-KeuM3KenEl0GQ60xA-1; Mon, 18 Nov 2024 07:40:47 -0500
X-MC-Unique: s_hx-KeuM3KenEl0GQ60xA-1
X-Mimecast-MFC-AGG-ID: s_hx-KeuM3KenEl0GQ60xA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4315ad4938fso29779635e9.0
        for <alex.bennee@linaro.org>; Mon, 18 Nov 2024 04:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731933645; x=1732538445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ca0cxM3UlWVse/L3ofROZ5zzW/nq8lsxvLIZ+MdO/Y=;
        b=vBXDJ+D7CxSZOTJCZp5bkXLj5IEpcCvbXo3kVrcnPqismEpRG5dtM3NL3/G7qQKyoe
         b7ppqJBAniokRny54jmnJlXNkqZITr59OcGdJEGb6xo3qk/o5a2Fakb+UNc5XyBC1Gri
         S9bPtyDzcyy+8IiY3jdXylgYILGa+/K8R3bMjWJ3HqD5NMOC7TBQkDK23fqyFjslTrNa
         2TxwumoDKCJ50VrxfmWbszt/Sn+lspGSyucsIOmjvYz8BZMsSmo1TV1BfgaJq+46SOyE
         eLysYwTJiRsxYdklPto6aUHf4ns7vfYA0PaEzkmMgHCuvUM8K5Cnk7vvB90wMOHoNyI1
         7qbw==
X-Gm-Message-State: AOJu0YwlOnJMbs1wmlTarLxeM48dZXMRLmnop/t9c9mihlN88k4/FMHY
	AzoDwLPX9LLWos0Pc+t14Y8f2Vv2ff8a9h66Y3GaF1BwSjYoiR2x2pLln5EdboQUiCOCjnMnOZR
	LDHROb9sn626L2mkN4IWOPqnDJdoUAxVb+izosb54aLTkZ/QWq22CwV8J4M9bSJZ0B+f0bhb1aJ
	0af1Kv3Sl4yE+qq1ZAQ6f8xXqhH5cBJkNfMga4bL8=
X-Received: by 2002:a05:600c:a4c:b0:42c:a580:71cf with SMTP id 5b1f17b1804b1-432df78f0f9mr115423445e9.30.1731933645644;
        Mon, 18 Nov 2024 04:40:45 -0800 (PST)
X-Received: by 2002:a05:600c:a4c:b0:42c:a580:71cf with SMTP id
 5b1f17b1804b1-432df78f0f9mr115423175e9.30.1731933645387; Mon, 18 Nov 2024
 04:40:45 -0800 (PST)
MIME-Version: 1.0
References: <20241117161039.3758840-1-manos.pitsidianakis@linaro.org> <875xoku5vd.fsf@draig.linaro.org>
In-Reply-To: <875xoku5vd.fsf@draig.linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 18 Nov 2024 13:40:33 +0100
Message-ID: <CABgObfaVs-3aXKXtQRLDbzCL56gbimWZoMchYi5G+QGu8r0AxA@mail.gmail.com>
Subject: Re: [PATCH v3] rust/pl011: Fix DeviceID reads
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, qemu-rust@nongnu.org, 
	Gustavo Romero <gustavo.romero@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rICpL_odWuuvVhKvvbg6OymHO2o5Kfa2Lq_JQBomUJo_1731933646
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: vFLFS2VOKj+G

On Mon, Nov 18, 2024 at 12:41=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
> This is a nice improvement in conciseness over the separate legs removed =
bellow.
>
> > +                eprintln!("write bad offset {offset} at RO register {d=
ev_id:?} value {value}");
> > +            }
>
> Is a binding for qemu_log and friends on the todo list?

Yes, see https://lore.kernel.org/qemu-devel/20241024-rust-round-2-v1-10-051=
e7a25b978@linaro.org/
and my concerns at
https://lore.kernel.org/qemu-devel/e8e55772-906b-42cb-a744-031e6ae65f16@red=
hat.com/.

More reviews are welcome; in general, we should define a convention
for Rust functions and constants (is it okay to rename constants in
the Rust bindings if their C name is ugly? should functions keep or
lose the "qemu_*" prefixes?).

The corresponding patch to move from "eprintln!" to the logging
functions is at
https://lore.kernel.org/qemu-devel/20241024-rust-round-2-v1-11-051e7a25b978=
@linaro.org/.

Paolo
