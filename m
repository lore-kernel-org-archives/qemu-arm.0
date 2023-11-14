Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2135522ejc;
        Tue, 14 Nov 2023 07:56:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNQogxxsU2fZE6Mvq3QUV/gAXU+actxYFsbb4GzfxYE77HnfTg52wIHtG8gFdjCl/mSu3s
X-Received: by 2002:a5d:6b0b:0:b0:32f:7a07:be0d with SMTP id v11-20020a5d6b0b000000b0032f7a07be0dmr7545157wrw.59.1699977403753;
        Tue, 14 Nov 2023 07:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699977403; cv=none;
        d=google.com; s=arc-20160816;
        b=o7B2b80/cBXzQMdPmeVOgF6ht4ZSlZyCOQ/0iL3+M1/cMCO5ykvjxmImgVS1TuCHNi
         O87DvMKjS7S5fO4ucRIDpHDIz0lqwSZp72yMgc9bOKz4kqikkpizZbZJG3T5/4AqHeyT
         3qafthXtOo0gRshAM1oE1JXRQ4MTcLQ3ZIuuD0nHKEZgP5CaRR8XBplbAtchpWIY9Ut9
         +GFPYw9FaSLOIn6nvo3R6krvy6y6MS3Hok45bYInvfd5+sez6D5zvc5Wd80GzInX7D6K
         2o54WUTE3hTwDJgx/n4XUnFxvPim2Sm1gi05tvYnm1xjHonedJK2DZwVasrl9DGija/i
         Co/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=JfeV0qK8CgxsVSu2eoR2UV6eTjBlrnZLZoYR1NzgBIE=;
        fh=a49yvnv3KxGk7E8aADHw3h5GIuAxWMoRWKUT+irjRrQ=;
        b=xJ+s9+rO7d6AQ6RUMiOI3laidCuihnytixgmdG64uP78sxSIcWEbUk4nrHP0vsUdPR
         hTcsxU/s2JxmauWbZuVsQJtyJ3PTVBUpDOpglLy2ZbP/ATAhTfq57CMQ9f5U1UTQbbNX
         6yEMlhYHsW6AyEsEHSkfrnIqFPL2pMDrPr4/QBAUSeUPBJdJvA6VON8nnF7+PENRZQuF
         NToHJNbVf/bpJlC7MUfb4gxriPLzlmVgyhRNkSKv0/bnsFNkiXj1Ku5jQFNWamIY9B6O
         2++XKh0rZG75vD1Q/nkdu+ySwpBXz7vByFAbtsnWjmgjUqZEgf+1ZMIjQCcaxMYGeDze
         PHrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=bgwhwUbv;
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org
Return-Path: <BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org>
Received: from desiato.infradead.org (desiato.infradead.org. [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by mx.google.com with ESMTPS id bp1-20020a5d5a81000000b0032f7e4f3728si5104820wrb.928.2023.11.14.07.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:56:43 -0800 (PST)
Received-SPF: none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=bgwhwUbv;
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JfeV0qK8CgxsVSu2eoR2UV6eTjBlrnZLZoYR1NzgBIE=; b=bgwhwUbvJ39iHovOHLIjZRuYBI
	iqXx8yCvVgl16/UeT3qm+ITCuxnj7dx/R19vrz6jG4ClQBKJZB2HlsWRvTfgl7QINLlnCDSniROfZ
	TvXrdS6AObLK2YQuW5WAgCoSqIW6+6pjppciWZKYJ4LxHBad9Zo/xlQFXy+D1v5IoJxWevGiF4C3H
	jvUOBc8KZLf+Dg/5oCTe0K00sFe/Di6RytUaBWsDh3pwdCsLv/shZtt5AXYtqV5CAepgDLUx3ULWm
	/4/pOMD7KYrL3+skL+3V8pO4O1Q0c5Dz+kPmNHK5F/rzeI5WrIWKFi3LAtjNrsms6s3kuYjw8XEUj
	Oj643nXA==;
Received: from [12.186.190.2] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vmM-002YdA-0t;
	Tue, 14 Nov 2023 15:56:42 +0000
Date: Tue, 14 Nov 2023 10:56:38 -0500
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_18/19=5D_hw/i386/xe?= =?US-ASCII?Q?n=3A_Compile_=27xen-hvm=2Ec=27_with_Xen_CPPFLAGS?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-19-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-19-philmd@linaro.org>
Message-ID: <F6740A4D-7968-4F51-835E-E50AD646468B@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: rdoY671iaDXf

On 14 November 2023 09:38:14 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>xen-hvm=2Ec calls xc_set_hvm_param() from <xenctrl=2Eh>,
>so better compile it with Xen CPPFLAGS=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
