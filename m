Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp346352ejb;
        Mon, 13 Feb 2023 08:28:22 -0800 (PST)
X-Received: by 2002:a81:b34a:0:b0:52f:11e8:586e with SMTP id r71-20020a81b34a000000b0052f11e8586emr4769107ywh.44.1676305702532;
        Mon, 13 Feb 2023 08:28:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676305702; cv=none;
        d=google.com; s=arc-20160816;
        b=xM27SDzgi/wZw33iPjDMjYPm8h0sIFrJkIAOsD9Qu6Qvlc7uhxDk4N2g/ahEsYaU+q
         s7A/JQvVpTxA+hTlO3Zn7WY0NlEr4iH3UUHveiqjweKEIbGUpwwxdMSPW4jyh+NRm9U6
         MLlvhLfS1TCcw/HZKOgFjd0Hqpa3z8dalNcQE7BYeGfkaKaDumh5QoEo8JxE54fEsHIh
         93UoddrzuPY85gny/E/fDvL9ROSllydcKXGWnHIXvG5/EsQKBcq1LU8lHkDd1JgUcRLh
         WyFGJWVQfUFMmeeVYqr8mq3Bw4f/Eqgcp3h5bko+s+JCIyf8386s/42wkPSDgXcvijcX
         bo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8b+X2P1yGlmruOMU0rvAHEKfacIwCC/xngt49aGw2lo=;
        b=RhiJ0A42ia7YNZOnOF2igoaJWCkGLHUaiHPRv2Wyo+uCazsckKNYsG1Od/yPG10A3o
         lOBm6YZ4mpRheWIOvY111KzA5XYrU5tyVICptBDoqgqxTEKzUhuVFwwNZPeyOUjakO8l
         6OoOA5ft7IlvS18llYvjMJ47ctnv4dtmk7oLb5B0QoB4FeJM1gJmQ61sxWBxhZaomqqx
         N7E8GpFwrHnfrdrIDwuuEKdZ6gWQTTv5y+QtLpbk5N6bop/W6yvE81qxlvjIuygpyK9N
         5apjRf+6mGNovr5Z7BZyXQBtZ9sZ2j5jYYssU8OkKuaZIyC20dEOnIw+K6Nln/Cpk5Yu
         ybXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="T/PwpB3F";
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z1-20020a81aa41000000b0051cf62519fesor5624012ywk.124.2023.02.13.08.28.22
        (Google Transport Security);
        Mon, 13 Feb 2023 08:28:22 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="T/PwpB3F";
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8b+X2P1yGlmruOMU0rvAHEKfacIwCC/xngt49aGw2lo=;
        b=T/PwpB3F4VWnuHe4DCsMNdpqcvVholqCJp5rCe369JZoQ16RP4jXudqXnU7wQK7D0y
         AZYJT7TcaX2PPG3JiZpYvfmgGEMSU0HjnM0LTHvAmDG13rHb5facAVVwgDw7gsA1aThe
         OsmDXREsHCvhpYqfRqE/YT8Slmz19KKbXdo6uaE0aB+M0nvcnpDa3DcE8XaFAgQAxhlu
         IM+AoyOAXiGXNM6fjeVehkotXOteUKxrAYk/mMHAbOTY0wqEo1hiUTgNvOj6jVOUzvjb
         LPzV3nh7BHkNROVB/k553CPQqsbkgVomrnDL21HIlwwhlwk9S0fQJhX3xXKzD1/iTTrm
         DiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8b+X2P1yGlmruOMU0rvAHEKfacIwCC/xngt49aGw2lo=;
        b=hb9sGdttvwIKBFahGZt7FahnVSYFAWbv9HsQSTtZcijNjJdaJ+ixQCa+xwMKLD54aG
         SB75et2S3DyCVtF/3OJ8lv+Rt2kIObHenpvX6PpHkWOyoNCx2gWmO9PdwVAV+Fd4LSIY
         2WqCIDUh1mxnxE58+oGTycenncgxOJ/3ByteaA6KdLoqHQmphh0t8YbRW8gIo9lqbs+F
         kwmUB5JhtCe5b0k68LMQDfTFc84NqzULwdeQxF79vvICY5QTrOtb7il/k9uTRcoiHos1
         W6Bl50dfrtmPwfLNdkQdvkfNZDWsu9T7U/cKg/I742Y5gKsdl4nRPgvH0j6kHRMlVijq
         rfcA==
X-Gm-Message-State: AO0yUKX0EaHKLWRBQF90SaEXyN3u29+ZOlUkwJcZD6NImT37w5SJsq+w
	vI7QKWdz3ceQbUvRh2erkDpzAXw6w+y57xz5rBSdOJjNuPRKPw==
X-Google-Smtp-Source: AK7set9u3ZKVeFfcSuo5X53ky0HquVkVkhbfDkO+4xvBF9ZvkhVJmOsDKW4M2nLDHZHtKUSaMK+0tfVQ2ZyAxobqyQA=
X-Received: by 2002:a0d:f581:0:b0:506:466c:480c with SMTP id
 e123-20020a0df581000000b00506466c480cmr3245151ywf.253.1676305702199; Mon, 13
 Feb 2023 08:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com> <20230114161302.94595-2-fcagnin@quarkslab.com>
 <CAFEAcA8cOKCDF5_oxNLDd7JzvwUCC4_g_8RRmwPK3C2axLHuAg@mail.gmail.com>
In-Reply-To: <CAFEAcA8cOKCDF5_oxNLDd7JzvwUCC4_g_8RRmwPK3C2axLHuAg@mail.gmail.com>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Mon, 13 Feb 2023 17:28:11 +0100
Message-ID: <CAF8_6KmYyCwKEoNx626uEKUJZAFB_MgLRHrTyeAkDdC4C2YfMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm: move KVM breakpoints helpers
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
	qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
	alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 8jwv+lxwJds1

> New files must all start with the usual boilerplate
> comment stating the license and copyright. Sorry I didn't
> notice this in previous rounds of review.

Pardon my naivety, since the new file only contains code from
'target/arm/kvm64.c',
should I just copy the license and copyright comments from that file
(and adjust if needed)?
I'm not able to find any particular procedure to follow.

Thanks,
Francesco
