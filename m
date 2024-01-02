Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp146010ejh;
        Tue, 2 Jan 2024 13:37:15 -0800 (PST)
X-Received: by 2002:a05:600c:46cd:b0:40d:86e0:83b5 with SMTP id q13-20020a05600c46cd00b0040d86e083b5mr1709833wmo.259.1704231435580;
        Tue, 02 Jan 2024 13:37:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704231435; cv=none;
        d=google.com; s=arc-20160816;
        b=v8gJvOdrkgCP/DJmEZV4jtXJvCNJT8cfOg6XVdMu2vhnU/Fb7J0iM5wT+MVD+hV39U
         bO1TTwxEG+c1iOrACQ1CanSGXHDtfxL91nUf3j2kKz7I6nouwCbZhGyAwWX+nqjWYtkq
         5lR3qVWd/Pe/EF9Uut6Oa2sgx4TkqlwPBi4vXqnYmrFLuDWPYgaFNZ5n1B23OuIN/bhL
         83iQ85BfnRdfLQKeLr7e+JsXs1iRmmLqFK14q2LI1+br8n4qQ+VA1DPLVBMgVowpdP0g
         54S8YNYhDAUk2xO3RK/gZoyK3AUDSGTP2OZcu9+Q9JV/hoHbjgzmzwMERijpxqjLHNL8
         EUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:dkim-signature;
        bh=/j7/rdcZmoVQjecAI6/HxXOPJUcRBJCUvX9qQzCAcW8=;
        fh=v1JMffJ9CSjS8rLFOjX4ECizuHzi6V75Wk9YrbuZeL8=;
        b=FQXLkVs5ZqoKtlQzvVXlJXvxRC6p1weg25MMwIV2UdfL3pux1sk9eSM8LHw92rcJGH
         LlWT5J5ygzCSKNEhyKBGvCEa9Mpjq9ElxhfbJ3QTf7JpeixDmU0e5EidlGtAvtaR2bcA
         PJ3RYz2dFrJ7bA5nAUCV6PW4IJ0DmxOdS2ZslmjEfpxGmzhmi6SFfuvM1VKfUnYAItgS
         7rYuRyRr6MIYdAD7SrotS5PyMH+z4FWuJfUzL23NbmuPeZ3z/6+yeUOo/gkJbqokIT6b
         I7rQjHUq5BpOoYre9uD27frLKnDHtQlG1hmE/j89yMF2Z3xlsXjygV5bLAw7kP9IhL83
         KJJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q9lWwhCY;
       spf=pass (google.com: domain of shentey@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=shentey@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <shentey@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f7-20020adfc987000000b00336c3920e79sor416573wrh.3.2024.01.02.13.37.15
        (Google Transport Security);
        Tue, 02 Jan 2024 13:37:15 -0800 (PST)
Received-SPF: pass (google.com: domain of shentey@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q9lWwhCY;
       spf=pass (google.com: domain of shentey@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=shentey@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704231435; x=1704836235; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/j7/rdcZmoVQjecAI6/HxXOPJUcRBJCUvX9qQzCAcW8=;
        b=Q9lWwhCYTLJdQc4CufhcYoXF//eDj0VolNxfBO5rETJyOjbabyFiFBNCo8gL8uN5Ll
         z822teUd1fGyR97z374Ld4wz/H6YT69nXmApYQu/g7IWG8vnNMwSWRpvRBVoGQx9BBAE
         J4obnlejjHfF9KjndgQVHAEnBRM7YVmNS0b763em4CfmbKuptMoinufI3FKD0liVs/UU
         0I0iM+3dHS10G+MbF11oLVQi/lwUBJ2z1NyWjoQqh01eQQ8lcrUCRuemzjk6Cf6nF+HV
         O08TnIqiW8UNdyTmSH5dhovQcTRGXrhIZUDa5ClHJkD34eAqUvcy2bzm06vbNhndv+AL
         E/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704231435; x=1704836235;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/j7/rdcZmoVQjecAI6/HxXOPJUcRBJCUvX9qQzCAcW8=;
        b=nClECfwDIuKm0GT5+ekMXyMzKgbap4V/enkZinZNGi6R2TeJkpy2G1ZUb1Il6SgnxM
         U9JUsgwXQKNRZ6XT9C/Z1QmO3Ik+Bs/N5XK2wkQCj+CmjBCP0Cbygd6z7I6bntge7NbH
         cyjBa62Wy77C/p/8m4PJDGBvPMbaGyUKzdigzscNncy3+n51D3dYKsU3oADkdB8H2H9C
         XWPHza43U7YesXwUOOmf0PBF/47w3gq0KnCSInf0ms10fRc1eYClLVD9XSmaRu2SsZPe
         +HWq77gppAQ3eMEcpX5vS6A5EzYQTPwLld9Uet6wBxWzpUhIYhh5b4P+jdzuDFw3wRUd
         le1g==
X-Gm-Message-State: AOJu0Yy/n5q8m9Qp/ZEXbTq5NeRK2plw9bCqDwLhMHwnm5R19gTGOu4s
	pOhpW1r6QavQkPHT3FZynks=
X-Google-Smtp-Source: AGHT+IFrz+8G4XaufDC1u0mAfvhOGqc3F19J3DroZasFggdJGsufr8PGV5ZiaTqLN5DOoVoj9N8dAg==
X-Received: by 2002:a7b:ce13:0:b0:40d:6f34:5c13 with SMTP id m19-20020a7bce13000000b0040d6f345c13mr2971570wmc.231.1704231434891;
        Tue, 02 Jan 2024 13:37:14 -0800 (PST)
Return-Path: <shentey@gmail.com>
Received: from [127.0.0.1] (dynamic-089-014-091-072.89.14.pool.telefonica.de. [89.14.91.72])
        by smtp.gmail.com with ESMTPSA id p34-20020a05600c1da200b0040d8b4ebd55sm252596wms.0.2024.01.02.13.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 13:37:14 -0800 (PST)
Date: Tue, 02 Jan 2024 21:37:00 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paul Durrant <paul@xen.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander Graf <agraf@csgraf.de>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Fam Zheng <fam@euphon.net>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Leonardo Bras <leobras@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liwei1518@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Stafford Horne <shorne@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Eric Blake <eblake@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Halil Pasic <pasic@linux.ibm.com>,
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/5=5D_system/cpus=3A_rename_?= =?US-ASCII?Q?qemu=5Fmutex=5Flock=5Fiothread=28=29_to_bql=5Flock=28=29?=
In-Reply-To: <20231212153905.631119-2-stefanha@redhat.com>
References: <20231212153905.631119-1-stefanha@redhat.com> <20231212153905.631119-2-stefanha@redhat.com>
Message-ID: <CFD7EE4A-D216-4CE8-B963-0CCEEA623E53@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yq/7LQ4FYZ0A



Am 12=2E Dezember 2023 15:39:00 UTC schrieb Stefan Hajnoczi <stefanha@redh=
at=2Ecom>:
>The Big QEMU Lock (BQL) has many names and they are confusing=2E The
>actual QemuMutex variable is called qemu_global_mutex but it's commonly
>referred to as the BQL in discussions and some code comments=2E The
>locking APIs, however, are called qemu_mutex_lock_iothread() and
>qemu_mutex_unlock_iothread()=2E
>
>The "iothread" name is historic and comes from when the main thread was
>split into into KVM vcpu threads and the "iothread" (now called the main

Duplicate "into" here=2E

>loop thread)=2E I have contributed to the confusion myself by introducing
>a separate --object iothread, a separate concept unrelated to the BQL=2E
>
>The "iothread" name is no longer appropriate for the BQL=2E Rename the
>locking APIs to:
>- void bql_lock(void)
>- void bql_unlock(void)
>- bool bql_locked(void)
>
>There are more APIs with "iothread" in their names=2E Subsequent patches
>will rename them=2E There are also comments and documentation that will b=
e
>updated in later patches=2E
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat=2Ecom>
>Reviewed-by: Paul Durrant <paul@xen=2Eorg>
>Acked-by: Fabiano Rosas <farosas@suse=2Ede>
>Acked-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>Reviewed-by: C=C3=A9dric Le Goater <clg@kaod=2Eorg>
>Acked-by: Peter Xu <peterx@redhat=2Ecom>
>Acked-by: Eric Farman <farman@linux=2Eibm=2Ecom>
>Reviewed-by: Harsh Prateek Bora <harshpb@linux=2Eibm=2Ecom>
