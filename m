Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5167422lff;
        Mon, 13 Jan 2020 23:32:04 -0800 (PST)
X-Received: by 2002:a5d:5283:: with SMTP id c3mr24125050wrv.148.1578987123993;
        Mon, 13 Jan 2020 23:32:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578987123; cv=none;
        d=google.com; s=arc-20160816;
        b=bBA5xNd/VYk+lnwL1paj4+HvMwtSw8Ug7/XbjS1BybjGkjR7tHENjerJQ1Q5nBi7Ji
         Z62G4krPO4b7ZBBGMDMWo3Q5a7HG5LL+2J5kH/kTxRfE0ePN1nIe1Ix6bG1pyfnBoQ1q
         fOpbk1788kQjJdbC5/fjRpU9vdGBqwD32O5NJq2l1bseho7LsYY9MQnIVXdbDl5eg+y9
         22rqMCUQCr+mh99qp2JwISpkjBxE00NPCEqJHpRPqozcGlL0n2j1Fjx+utShHvwipL6S
         2DrRLATli+/lzoNPmFzzD35UMN7a8sgS56VzCZQ7nSLgD3fnvGWSlB2Gp5/doHt0AJTD
         g5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=gZnEP6uZAH9ok1af2x2KSlY6860iu5C7sbphf32Rr/I=;
        b=ISiAtGKYh56MfdrJFOJbLvgzSI7gkVi0YJMOqE6K0NbsJIAHmyafx4XKMVDhLi20Jb
         SQ0wXbq8Objzr45Wu8kM9M5RrR/2gb4BsoURvmi07NqO5gonOOiQYqJY4VBI/e+7B1oJ
         XaKY/pc8CRpjXDj3lIgS1JO+s1m4I0VU0HqgyFqcJAzUNbKlewgJosE5LQW2dw5oDjva
         oLcaPXiMCSpefGFhlZRo4g+/9c0tnnwhrt7mUyeoAW/MVVANdMoRKVogOCS7uwpjBmdJ
         rLiPQDRlnOD5Sw5CU81nY3Cys/1QpAnWXZh1WKanVJjsZxtGWIsrLpvNnfNTm4Y109Og
         w/bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=FYkUwao1;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
Return-Path: <ilg@livius.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o13sor5811045wrw.46.2020.01.13.23.32.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Jan 2020 23:32:03 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=FYkUwao1;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=livius-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gZnEP6uZAH9ok1af2x2KSlY6860iu5C7sbphf32Rr/I=;
        b=FYkUwao11/xmenGN7AVxRXDDKq6nnLR4o9JxLiL7GXlcU9F4S8OYnBJritvySFewKB
         zbUleu5wFjVD295DCoK0VBJWFW+HkIQAbgJMKIZLWstKgFOFY3PGGnWSfmsIM5s4VuJR
         lZCNWhHJKkEvodU0udS452endY4t6yF6TdDJ1Guupx7jOwZMZyHi89wcCwmiK/KCFHG3
         V3R50FFJxZgCNByCsy3nynJxaaCOaNthI/JuybpqbuWwrNNkzS5PicCJiZV+9FttrpvS
         a4CHn94LcQUK5AFjWzQSaohu9RLMtgYsDCih5vhrJa/MqX8x9DafZ/Ml6hhJ7MKZ8BpB
         Vl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gZnEP6uZAH9ok1af2x2KSlY6860iu5C7sbphf32Rr/I=;
        b=HfZzXA/89WL7LqWdh90W4GruGtgZyC+rYpumWVUXjPQTgE3IsmZhoYU6MqRx0H2x9+
         Uxu7WjLjcT9Z6EU/AQzmsikztQVuEvVxJXK7kY+lJXwUcC35eqhJ3wqtPFpy4XKn8EGx
         q2otl1342tAiqljTT4ayIhAXFSfKrcL6QjIWNa47tJ1d+AeQBPgJ9zt6k+u/DutVnhWJ
         saXFASIXPRLE1nURj9vmilq1ZAU075mjPfbmsdNnB0SiN9nv55XRp1vrMAtY9VzW569O
         2Yyl30QK66QzAi4EOeUhYFPaVYz5v/cjnV2gm0f3GPmaL1lhfYBZVDOHdtBhvSVHQrJb
         DVMQ==
X-Gm-Message-State: APjAAAWGtt5e3XkzASVSUo8NCImveMkjQ8ZrirFFDX7QV22ydVVfwVEC
	gd/czpHBRmG+fNf5lU2rka62ZIFJEIVlcw==
X-Google-Smtp-Source: APXvYqzDtaEnwHPyOErO02TDJZFUVd8ZAouL1qi/EoU02YZ3zt2Yeq0H7GSkKNM83OdoapZCbnv8NA==
X-Received: by 2002:adf:d183:: with SMTP id v3mr23385941wrc.180.1578987123563;
        Mon, 13 Jan 2020 23:32:03 -0800 (PST)
Return-Path: <ilg@livius.net>
Received: from wks.local ([188.26.232.206])
        by smtp.gmail.com with ESMTPSA id 124sm18323074wmc.29.2020.01.13.23.32.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 23:32:02 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
Date: Tue, 14 Jan 2020 09:32:01 +0200
Cc: qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 keithp@keithp.com,
 qemu-arm@nongnu.org,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-TUID: L4pOQT/DPnvE



> On 14 Jan 2020, at 08:25, Benjamin Herrenschmidt =
<benh@kernel.crashing.org> wrote:
>=20
> I noticed that the bulk of arm-semi.c (or riscv-semi.c) is trivially
> made completely generic by doing a couple of changes:

Last year I did a similar exercise in OpenOCD, where I took the Arm =
semihosting code from the Arm specific location, extracted the common =
part, updated it for latest Arm 64-bit specs, and then used the common =
code for both Arm and RISC-V.

If you think useful, you might take a look there too.


Regards,

Liviu
