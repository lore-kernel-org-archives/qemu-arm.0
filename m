Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp65358ejb;
        Tue, 21 May 2024 18:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKXe18Klr5NiixkrzoZyCzOdm5BFWZefE9IFt3zBP7UhaTwdXiWqrU+TOyJOf/b8Ez1+/ac6Ezlx/vdvde21YMRvsILiwo
X-Received: by 2002:a17:902:e54d:b0:1f2:fc8b:ebfe with SMTP id d9443c01a7336-1f31c9f4ec3mr8274005ad.48.1716341299479;
        Tue, 21 May 2024 18:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716341299; cv=none;
        d=google.com; s=arc-20160816;
        b=nCmpydCluBcWciMohKZrO91gT2zmKbJ0FGzNrb4wkUZPJ421VmEZxNoOJpkGYW/Iqn
         pUl8Se0ZmsX3nLb7VL7ZXZGpgQ1hadWBQ/tCv4PFioKZpzibn00moCo4WVC/b1FfTPYY
         eLwAnA4c7mrlLlL5iDp3CJbIXN1rMjX0efFaWrdEYXATvndlQVQwQ6wMuZelth9/RePf
         96+v/gG4/+dU8OlbjsnWK//+5Q9oRyR6ZV7hBF1Ul7VRkxp0ZE5QTYJ1hIZehecUgvL+
         wc0WNh3ZjdRmvv4lw4RdH90UN6lwIwSvhNAhHzxTv7rQ79QKqXJP5n0tylrW34fF+4PI
         6eXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=Z8+45UbJqhnL0QMSfsyZha24gsr//tDC6rBG6qGE3m4=;
        fh=DaYS2D1ojo9iiCoKVFRXKxYMXkdEMYp/YKFHqaiqGXc=;
        b=x5BiP2vuzjvmYMZzIcCY01o6RuEILF5EBLk68NePUbKJVYmAX9oYQ0vkeBenNNarkD
         UdxTI+d2w9F/HilZ/TW7K38MBuNXOdW/mReTbeacLI9T5XlWVETUQXQHNOTChe8/J2Ku
         k3c9lMA19GrpUJPd7Vf8A6h/UDGWvIKsD8TGWJ9LWiOojsgI7rSAfNHk0zn609s6bjAB
         +hutQRI62kZtK4M8s4Y3oxe7+f7PINIQFCjkLZqdBnUaZlTjvO4HgawyAnvcbBHS/fjN
         t7lZt2LXxP/XM4ORA1kMbRmf/1Mhgt6mKizi1leStuYORBpRdtWQC/BVISfzDRBH9WND
         1zgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="L/zTnazQ";
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1ef0bbff940sor153668015ad.10.2024.05.21.18.28.19
        (Google Transport Security);
        Tue, 21 May 2024 18:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="L/zTnazQ";
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716341299; x=1716946099; darn=linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8+45UbJqhnL0QMSfsyZha24gsr//tDC6rBG6qGE3m4=;
        b=L/zTnazQtQyLcLvngUpmhDYAJpKvhnvZLjGB3TW0DfpN/dT2EsJuWnJgRlQPEvoMBN
         ZPvdIv2E77a4N/lsGkIyxhA7v+0geFg892MUM6w9QhkcQD+BGHQMExYC10k7ylraWI9D
         U940L9Vi08DsgpCV7tIulKsbSoFNa5q58FZ4EZKtVGT+hpGfI0PZDepfa3pXZ6nRZjtZ
         XTJnwFs4CQ5KBjNmmSlUZNEflkISSY2EWJcnyY9/E8U/W2P9CUP0VHIBbnqMxN2FT3vV
         01eX2bb91horuB9lYiq+NI0iFqQNWhRIHxQKPMFWcMiWkZde4Lia9ItVADP525gxyx72
         Wkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716341299; x=1716946099;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z8+45UbJqhnL0QMSfsyZha24gsr//tDC6rBG6qGE3m4=;
        b=SHpu/FJPjXi2u6llBqjpIuWNSO2EexAJhlOsZueHSbXKPfS2wmu65xquO7nPwoz1Xo
         CSgS+2E5aaJqe7IgkEXnSMMQffMq46G46EpliR6zqjK7vg557Gn45weun7hgQYOPzYhH
         sbMN3AXYsSrTZJLIOGtueA2vfTMklEfvlW2SIdxLrBgPENSNOpIdgBFLC+k6KilDcCDU
         IVhS65685YFO7n2yR7rS2yno2RN6h0oVxowCqBnOVYhpSW5moUnhoFLHOWrk4Zxmeeky
         sBEuTIJcoEflpwy77dm+moNiyb6lmGPRzEt52CViGfNNb5xq544CR0gLxc1IW2Wjr1Si
         vOCw==
X-Forwarded-Encrypted: i=1; AJvYcCU2DBE3h4kHuNgMFCCXN8dv+B7UvmyM8nj0PJIQ5eYnCTia4ZiKXJxvwxo9zN9Cm/bRyfLtvx75vlmkSIZLcbt0OcSFTDotsqEXu5LNizBTr7nCy5O5GmjhtDdPegvHiOcUqlXkPzUpeyLSO55Ze71qBtDXzOJBUXo1VHJSorGBjnUFrwBgXuOT5rrBnPCVkSdoesunxbzP7AqbPbTZp5uY741DQM+XqyIUFQM=
X-Gm-Message-State: AOJu0YxcYlFQTXGoHpoU5ywcVcwxngU+9E3bKn8lAQIvQkY1OZOj/CDa
	4Eo//j0XEGkO6E62KfBzCqfxcPWoSGK5P1i4NO4ePhYzCLTsSDEN
X-Google-Smtp-Source: AGHT+IHqWtHKPsb4gI9rhghHOXq0HhPOjld4CQEuRFbpYgFdGCerdkVihCPVCJkIcnfG4fkygJcYJw==
X-Received: by 2002:a17:902:70cb:b0:1e9:470:87e6 with SMTP id d9443c01a7336-1f31c990022mr5923175ad.23.1716341298843;
        Tue, 21 May 2024 18:28:18 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f30dec58d7sm20426775ad.22.2024.05.21.18.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 18:28:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 May 2024 11:28:02 +1000
Message-Id: <D1FS7GB6BURV.2A48UEVLGWWYA@gmail.com>
Cc: "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
 <jean-philippe@linaro.org>, "Jonathan Cameron"
 <jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
 <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "will@kernel.org"
 <will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>, "salil.mehta@opnsrc.net"
 <salil.mehta@opnsrc.net>, "zhukeqian" <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)"
 <wangyanan55@huawei.com>, "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>, "lixianglai@loongson.cn"
 <lixianglai@loongson.cn>, "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
 "Linuxarm" <linuxarm@huawei.com>, "Shaoqin Huang" <shahuang@redhat.com>
Subject: Re: [PATCH V9 6/8] physmem: Add helper function to destroy CPU
 AddressSpace
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Salil Mehta" <salil.mehta@huawei.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
X-Mailer: aerc 0.17.0
References: <20240519210620.228342-1-salil.mehta@huawei.com>
 <20240519210620.228342-7-salil.mehta@huawei.com>
 <D1EBOZTRN8SZ.Q9F4CFDZ8VYW@gmail.com>
 <46d1577dc27a4012bb90d9871d03fabe@huawei.com>
In-Reply-To: <46d1577dc27a4012bb90d9871d03fabe@huawei.com>
X-TUID: lD5OXCgOKk4r

On Mon May 20, 2024 at 8:55 PM AEST, Salil Mehta wrote:
> >  From: Nicholas Piggin <npiggin@gmail.com>
> >  Sent: Monday, May 20, 2024 9:19 AM
> > =20
> >  On Mon May 20, 2024 at 7:06 AM AEST, Salil Mehta wrote:
> >  > Virtual CPU Hot-unplug leads to unrealization of a CPU object. This
> >  > also involves destruction of the CPU AddressSpace. Add common functi=
on
> >  > to help destroy the CPU AddressSpace.
> > =20
> >  Patches 6,7 seem okay to me. I would like to see a series where they g=
et
> >  used. Would it be possible to include at least a TCG user in your seri=
es? That
> >  would make it easier to review and test.
>
>
> If you wish to play then you can use below repository which is V8 version=
 of
> architecture agnostic patch-set plus architecture dependent patch-set
> stacked up together. This effectively RFC V2 rearranged with clear separa=
tion
> of arch agnostic and specific parts and some review comments incorporated=
.
>
> https://github.com/salil-mehta/qemu/commits/virt-cpuhp-armv8/rfc-v3-rc1/
>
>
> It has TCG but it has some issues and hence we have disabled it for now. =
We are
> working to fix it.

Thanks for the links, I will take a look.

Thanks,
Nick
