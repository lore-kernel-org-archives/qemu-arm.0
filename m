Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp89723ejb;
        Sat, 3 Feb 2024 03:23:57 -0800 (PST)
X-Received: by 2002:a17:902:780b:b0:1d8:f394:da39 with SMTP id p11-20020a170902780b00b001d8f394da39mr4375845pll.65.1706959436750;
        Sat, 03 Feb 2024 03:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706959436; cv=none;
        d=google.com; s=arc-20160816;
        b=QOwqevR829h0JuM7GJIe2NV3H2mW988pEmFse55HqUoIY/EQJSchZH8J5Mt7PapEEW
         lKZdg8d0Tk0QKl3KbCAxBGmMcfGcpSb7MU8+TymJho0WkYUZOh7kRi/B12xHuMNBMYFG
         xZ8vqus4ctnbzsEDmErjKOxknzZS1yD4q9PVOkcvnlz5sFF8iXjYWKdE6bPyQ6HLiVhF
         /5SHqbt8AkwJZLVt1WDEH0+9zKsa3ijs422YC9/PDMdJ67TW3IzsWdEeZYSDpdq+6fnf
         83Rg9Q8AC7d4ympSXV4Sn20gg2zlvbDDXsL35c1GWgPz6j5xIybOvFGPthm4KATL1TCG
         NiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bSAtRqrGA4Qilfsh+L9FviEDBUsiw2624Ro/wIEyZrY=;
        fh=Z3/uoaswA8qHioVXefrlZAQ9DYj8Q3OKKBZo5ik/LOk=;
        b=C9ngfd4WSsBOmJuVjGZmD+AkUXNmomo2HP2/INuAwt7F+TvmroLymI27v2Mly00klj
         GfPLhJaPMGeunE8r/7pZBGF0iqjwcq1ZfPT1o+6y6xjXDiFxTfAaZs6t/Y0Kf5uvq5O/
         /i8+CS4ShZyjbb3J0IK0MOsYPuh9TnZE00eTd8sexgqT/7njotViGWW7R2DPW0IvO+w8
         3bsD1DESkd2oBkZloeXnyjrpTH2gmnplk33NXkJ8+ACWIHYof74PgK7kScUKv970dF6D
         /8DmKDLeMxcb1ObOhO93nREDIlSL7/ZEplt17UXHITKCfQOBOJdBjlz6j1tdGGvGWmT1
         SKFQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=vbJf+PN5;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q12-20020a170902e30c00b001d72461afadsor1984874plc.10.2024.02.03.03.23.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Feb 2024 03:23:56 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=vbJf+PN5;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1706959436; x=1707564236; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bSAtRqrGA4Qilfsh+L9FviEDBUsiw2624Ro/wIEyZrY=;
        b=vbJf+PN5Ho3eakhNQp+z4ZgHP8UXhTwW/ohBcZVN+DmCdsGReIG2a4p1aK2AjItTwa
         9wPBlb+NppnH8FfzJsb29pq6sAUHjbCg89dFTqS/6G1cqCQZZmvg+d7ueG//t/O9rYCZ
         SrD27qRwAxaPsze5BK4SyoiWQijCXwDS2Qx/7QUmKLxvQA0/Jea4iUFj3Jj4pjM2k/V4
         9roTwnOoyiXBChHPYodC2Eua7c0vH9YTTWk0qheZKX/OWYZkKa+qPT6XUqHfIN8H2lZA
         I3MwupQ5TTPVtm8LPTe0MlBZ+7RG1QuQNY3qjEvpleu4F7S+kazPeqRUS+i+0Fqvtto4
         67uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706959436; x=1707564236;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bSAtRqrGA4Qilfsh+L9FviEDBUsiw2624Ro/wIEyZrY=;
        b=OMRTPB6XL9MFx51d24x7LavjbD16JkDG6D62QXE0WF0T11vuAicIbhCi3NtqXtd2x2
         CjYDqfHBD1NQ1LT6NIb8F47aRSegKS4mkLlxNp7jCvV8YhbYKj2cYdPdcwoaLG+Z1NOF
         29MMRlZnwGKEWfAhR02jmWaCMa0h7xvfxETCH0pe5CCW563IPpd3OAvk2hKYYyXQIXKI
         FuTOvnIO0oWT3D28bvC2CinF8HAqJcLUaE2BrqoUXexRIVlOthuwLOzj3IPvhYLOF30s
         yQkYOXARXcPt/xPLdsBeAZwS0lP613xw3eLeOHcKbd0wbh1e2pgIC3KmMnetkzRbzcKo
         r4KQ==
X-Gm-Message-State: AOJu0YyOZwCuIcIi734kzv7WErdvcFaxtR9/Hss+E5pbdg0yZLdv6dDO
	okbOBo/M0OWA/T2I502rvUZdhbuYpeK0CefMuCxyo3jqSoQ0W86rriyT4l/iwKbvZolDR9YE+Gs
	B
X-Google-Smtp-Source: AGHT+IHPaqap/JjgDEzVtaBWCtzuONuSGi44VB6rioaLH3Z6bjrWFq6xvyRFUPfLWxury4+JZw7MgQ==
X-Received: by 2002:a17:902:780b:b0:1d8:f394:da39 with SMTP id p11-20020a170902780b00b001d8f394da39mr4375822pll.65.1706959436157;
        Sat, 03 Feb 2024 03:23:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWIhe73GuX77EdQC21jhOMH1cCMjup0xs9XUgvz1QDsTzxwNqNeC/XIRhOf9K5GlOal62DOk+GXrrsjLBUo3QzsWA5hx6PvHCmMOGtGVfaibSCr+dkYmjD/2iZYJnbmyWr9A2ZuWdUYte5beZq9faKwqpkWoI5qyA7OgmxThmp/FZA0n0+Dqyp8Ex4LSeEHvzKqZQSzqt65SS6eN3qGWruwuJf24r2v/Ut+VXwMmQted5ZWQOc6+4TULF8gGR9Qamo1/FtpwCTs9p7sRovVRajDWSFo13Y1pWVteuLkhnccEFtrYeCzrMqp1n+AWdnhobXzDvXAqZJIj6DipcL8RLrx2DZeuOQjcFW9Z3cBx2PpLtlElkG1/hJw7JcGjj4F9fJCFXkVDg5byreRU++FMXXYsFATP1SsN7oDjcae3q4vx/5fw5AYSq7xSMMbZ6YX0TJRN5ROwlWxtvwtppkCGUWw4qlHJRaUxbCeZY9Jl6lLd2ahPSRoKxtQNAu889P9pXLVngVE+d7A9LpA3v4Nrs5zZcNFeFBUrK+cY4aVq3bevKcobon8M3GXDrM+NRUJokn/GoYnyUtvAEb7l+oOHlfuu0tVuvEIfPmyTVPZ2i9xmz6MUzR1cB4pvTZF4M1GOKigg1Tl2ueeacSKbFcwNll3d7a/xkEY3MUC9tM5QNL1Jt9sdG7rUa1BOpHJO0HUUavRQ1d51RtI7j8RAg/PlEmEYkeVUqiw+rWm6A1iypL1RzM+8ek/ZfzUpXkPV9lBHN3ttgTxkVGcNYjXW/Jb91DDYF55YaDZ7HUd4UCbwfMXNLxjGTtT5S0Xv/fD9VCsWhon7d1F489j00eV7fA2m8ACC6wCJfixmMEMndGogPhzxI/nBs1exxVLTAik9QqDSKVqlfyY4fR+3HsLMGZtqpvH3WwUhRYPJvrf+r6CRy45yB6A9zxhvHJ4hjhPfr+oj+0SJz
 QCPZi+ctqp1tXcFw4iL9vK2pBKIx7b9JCAgW0k4U0xnm7hKt1oXV2osBAVWRohKhI84gaCMy1S+A/jgfK3+AOSljo4jkKK6qbhO5khAntnenwGukz046w54fE29MTQFeyxJnvE4Q0OttlXReGZ8+t+GN249dt42XQtML7wEQ/pfvf6Djbxbsb0xniUgAJoMJh4SACHRM/bMrcthBIVR+rL+kSNC8PJY9/WztPYUkbyEa+2e8RUsUxuoZmf1ww8bWQYOhPtgsUur6T4l1T7eqS/WiMxTb8Q8et9XJ4I9x8kUo85ZYRtcpcTp2qTPCpWRQ==
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.200.138] ([157.82.200.138])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709029f9800b001d7207fa2a7sm3054236plq.152.2024.02.03.03.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 03:23:55 -0800 (PST)
Message-ID: <1c9a2e94-0c54-446b-99a2-69e25e9725df@daynix.com>
Date: Sat, 3 Feb 2024 20:23:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/21] gdbstub: expose api to find registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Laurent Vivier
 <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Alexandre Iooss
 <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Woodhouse <dwmw2@infradead.org>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Paul Durrant <paul@xen.org>
References: <20240122145610.413836-1-alex.bennee@linaro.org>
 <20240122145610.413836-17-alex.bennee@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240122145610.413836-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WrmPTGYDvSoQ

On 2024/01/22 23:56, Alex Bennée wrote:
> Expose an internal API to QEMU to return all the registers for a vCPU.
> The list containing the details required to called gdb_read_register().
> 
> Based-on: <20231025093128.33116-15-akihiko.odaki@daynix.com>
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20240103173349.398526-38-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - rm unused api functions left over
> ---
>   include/exec/gdbstub.h | 28 ++++++++++++++++++++++++++++
>   gdbstub/gdbstub.c      | 27 ++++++++++++++++++++++++++-
>   2 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index da9ddfe54c5..eb14b91139b 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -111,6 +111,34 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
>    */
>   const GDBFeature *gdb_find_static_feature(const char *xmlname);
>   
> +/**
> + * gdb_read_register() - Read a register associated with a CPU.
> + * @cpu: The CPU associated with the register.
> + * @buf: The buffer that the read register will be appended to.
> + * @reg: The register's number returned by gdb_find_feature_register().
> + *
> + * Return: The number of read bytes.
> + */
> +int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
> +
> +/**
> + * typedef GDBRegDesc - a register description from gdbstub
> + */
> +typedef struct {

nit: Add struct name; docs/devel/style.rst says struct has a CamelCase 
name *and* corresponding typedef, though this rule is apparently not 
strictly enforced.
