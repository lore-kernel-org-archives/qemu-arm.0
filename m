Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1381436ejj;
        Fri, 24 Nov 2023 09:17:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEj9u8Ves7KP4+XGy+p0B8+3lK/ctGtFdW/KRXIE2cDgaDFBenouHjlO9QAPBnn+dIkLpdH
X-Received: by 2002:ac8:5992:0:b0:423:93e3:cd0c with SMTP id e18-20020ac85992000000b0042393e3cd0cmr4191549qte.44.1700846228853;
        Fri, 24 Nov 2023 09:17:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700846228; cv=none;
        d=google.com; s=arc-20160816;
        b=TFnwWt5Ty5UTwIRXm1QoCWvPKFPUvWpkip0Hr1LeW18h6ymG/JHzgvvH1tou3H0ypy
         I2bnxI0xqH8cky/xtkQQNNoLRJ8R7s/yl2V6FfvYOgOPZzxarFzgytCAEiImRCTKRNIa
         Rm2OcOjqxd5WWPYd2qENopvtd1OaHBn3hL3cW9eTmxIOUvo2Yx11K2ORs7CRif9sPNpz
         FGI+A0hhONfgLvdZ4dh+eRaB9ZMdwFt/pEXQSy4fM7KwSMvr37zogpxJi/zdiRzPCsqi
         1lkxDRxwEwFeOHbMJw3V/x75STU6+7bSdUZa+lXJn3EVqwDoPzL7F2uPFMSiYBE6Xrj7
         5x8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=TjvOfBBy3CB1xDCiGei6x+xk0Ap+v5S7gV9mrBinp1E=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=xpxMQAA/7EeAfNRi9SbpWapBQKZiRCoUapwl/dB+KrRPqPYAXS5b7pnPh08T5FBzLu
         j48jl0E4/BkqVjk8+uP7dHCBEOh8tKGD3vw/wiqvjinruwB8yPulnJEhvMszj/72b/B1
         yOUEP/JZbSH0O7CqWF6qO+11ZgDZUsnQGtNvGxuR3iHeSVicy4zPlHAZjhYxIiRr/bmo
         gktbfEEBvyRDH93A4DsLqNgl6b7gAxxmUYBS4uICmiI3cD0HysPTMQug0JkfrjNzVH6k
         sI5sjj766oWpYAiGKWpm9lrbU7MszrkVUX/0jyD7RWYLLPd0CWitU6zSS7ID+xsUsrVs
         zQVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GB0Z2k1U;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j16-20020ac85c50000000b0042383d91459si3620894qtj.33.2023.11.24.09.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GB0Z2k1U;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700846228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TjvOfBBy3CB1xDCiGei6x+xk0Ap+v5S7gV9mrBinp1E=;
	b=GB0Z2k1Utf6p5ynvLAnj33phRzVp/e85fs7WTS70UpzZ/sWE6HfBJnVOcgf0Qih1dd+q2n
	EhCT4ah6oww3o3e1EhdWfed7zlOf0D5CglOHztgaXLpFCn3sTBpCS5AD52y2Hn8u141zyX
	knOSlquSaJVe2VHmd9x4B+XUHbw3gsc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164--16Id778PSCJ1Sv4hh-1XA-1; Fri, 24 Nov 2023 12:17:06 -0500
X-MC-Unique: -16Id778PSCJ1Sv4hh-1XA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77d78b44f19so221069185a.3
        for <alex.bennee@linaro.org>; Fri, 24 Nov 2023 09:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700846225; x=1701451025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjvOfBBy3CB1xDCiGei6x+xk0Ap+v5S7gV9mrBinp1E=;
        b=BQDkNBp3Pvf4dFdrr/NxClTgU1iY04dpv6AVY59Tn16SNicFoqkgFKXrX0oILe7gI6
         Nhyv1Isn9SqZukTQguYuWlr8FLzTgB3p0HMcqJ7pB0XWX3X9tZ0BzbdntgH9qtO7MVKb
         Pk8Hm7Hr7Vu336U0TpLlXyoYgG/McwSZj61LNT0bIASWHJJXELa+9EIUXtDLWoFVfr5g
         c9Ztw6HT2i86w9dUXbUyAUyIK1tLaxHTNYiMw3CIkBSM037sn/1CdaWQFkFw2WupUOtt
         FjcZ10C7Wf30W4z4JxcunTxVbRGfJA5HSwCQEBzAOl4+gPJR5QP+b54/Mu9Mg/pDViyK
         MJdQ==
X-Gm-Message-State: AOJu0YxN4lFG4KQmy/6CrccCXDS4lzH73zT42sPWsSfK14SmcWtBlt4v
	H6R4weT/pJBkD+gH5JvkVP0oxcuCUKMVBly7BO7n6WmFuS8DtUrQKqbTaol8NSSRrEN44/edFZB
	JtGAfil7vcnyek2ml
X-Received: by 2002:a05:620a:8414:b0:77b:b1d2:9586 with SMTP id pc20-20020a05620a841400b0077bb1d29586mr3527005qkn.39.1700846225732;
        Fri, 24 Nov 2023 09:17:05 -0800 (PST)
X-Received: by 2002:a05:620a:8414:b0:77b:b1d2:9586 with SMTP id pc20-20020a05620a841400b0077bb1d29586mr3526991qkn.39.1700846225505;
        Fri, 24 Nov 2023 09:17:05 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
        by smtp.gmail.com with ESMTPSA id z17-20020a05620a261100b0077d85b1d45dsm226840qko.72.2023.11.24.09.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:17:05 -0800 (PST)
Date: Fri, 24 Nov 2023 18:16:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <linuxarm@huawei.com>
Subject: Re: [PATCH V7 0/8] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20231124181658.4385fdac@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231113201236.30668-1-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: lu9tCR1EkrYj

On Mon, 13 Nov 2023 20:12:28 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

[...]
>   physmem: Add helper function to destroy CPU AddressSpace
>   gdbstub: Add helper function to unregister GDB register space
[...]

above patches look like potential bugfixes (modulo they aren't getting used actually),
only commit messages do not mention adverse effects (which they should do).

Question is:
    do un-destroyed/registered CPU AS and GDB RS affect machines that
    already support cpu hot-unplug? (x86/s380/spapr)
