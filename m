Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8151616lff;
        Thu, 16 Jan 2020 01:59:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwj/t2x/cbqb3DhBOmVzdqqQn6XV2qv1P/txeJAfMyvENQrmpH24yb35dTIO1coAfgyK+mB
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr5186585wme.82.1579168740785;
        Thu, 16 Jan 2020 01:59:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579168740; cv=pass;
        d=google.com; s=arc-20160816;
        b=MpjuwLXRP4lmdjYE8eXG2aVv2pKGUX/m5tR9kqluCoEwSqIiIUqj64khY501Vz5ZTx
         zL00uh7VWKgUuKpHbqGSyKW69oO5K1cTrMlvqW7JLOWCNHUSHAKIca4cAni2vv9dG+Ie
         JZFh3901daiD/VL6WtXDFem4J3NFaUOuvXeL6wpwDgfKnidJqDePUeGCmJa6SRHe2tYm
         POs/sFiD4Ei7ZMWRuiD3WR0fb2g6OGTtyv5d7c7oMCbN4CuKnVM2AyJCJWAqxKTHVpXI
         Jvr5BXH21VonDNz9D3eAeT61d3bzsfqvoKeAaSfb6f2dCOedzrSGf72c4xlkvYY0dQ3Y
         LOcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=gWggCHq2iVR6vAYfpXZ4nhLLYMEos/TRGVmYjXTFUWU=;
        b=CiXWyahvDAOQo+iDQxBn4sJQL+TqGQK0cizguZyAv0Y5Z/WD4aCQxHvhCm4BDWTVS3
         U0Zd64h3/DNjYPuCmPYpaZDXilauAyNY0sd93ExR/xX0UGnnUUn9JCMGOt7uNLnMsach
         cH0Jor6LHOYPQVfNktmPQbf6964my/CBtnR4ZA47XCB4JtO9OrdBHgeQnxl6fiNvGWGF
         8+2KY8afEHbO7BSODx+oZncv40zMldMQwgwc48K34zQE/80sFkSzca+GXSM++lfQWOWy
         oqueezSmTsEmhTbF9G/acKZ0Z8E74HIgg1EkP3GDhQlwp3Ki+B6ehWYUTKYdrAERtpaQ
         6svg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=CID4Z2SU;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id h141si3195238wme.54.2020.01.16.01.59.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 01:59:00 -0800 (PST)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=CID4Z2SU;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 5C33396EF0;
	Thu, 16 Jan 2020 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1579168739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWggCHq2iVR6vAYfpXZ4nhLLYMEos/TRGVmYjXTFUWU=;
	b=CID4Z2SUnkjZwvSR+HkST/klc7AMaktQ2hQBNwRatGJljUsj9Uhsi4w62wyrVVJTGGMalw
	ZfjAVEfnpMESMPcCrf/Cd6o/7p4seOsYSFgjh91h3tOVmXSxYFSiglHm7UW2T5MFRV8rId
	V9PgyAbXUL4ASZgXM11IWFF/+1DWkao=
Subject: Re: [PATCH v5 08/22] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-9-alex.bennee@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <e0cd91d5-4105-5417-22ec-b2367687ae4c@greensocs.com>
Date: Thu, 16 Jan 2020 10:58:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1579168739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWggCHq2iVR6vAYfpXZ4nhLLYMEos/TRGVmYjXTFUWU=;
	b=o1+u6b/JID6xTVs6KfoDaHnPeMu0bLT1P/h43XF1Xl+YSCOYhK16pMiJTMCR1BWyUEsZ0+
	Blx067AZxAUfAUqu/gaQx1CEQGjGzIquLnvcbILKycFfDlKIGs1zanYiOu9UJkwsQ/UYLH
	Hveb7532MjMQY+VgJotRrCHITKtJUNU=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1579168739; a=rsa-sha256;
	cv=none;
	b=Yrmm4XQH7iXon0GAHvjIQRTKNugnh8S9fKPh6BJwz1znHl0absnQ4Me52Q48loIBdr3sC3
	ZEUY7pK2oe5WwpkpxBmk2LX+Lq5dQy0TPAoZEco3sEGQ6xBJTLHLNlRdoNnSRCVl0rR8nu
	nlOzmtPh/11sWBW8mocjgURHZjv8BpU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-TUID: AdxlW7h/G4Qe



On 1/14/20 4:09 PM, Alex Bennée wrote:
> Instead of passing a pointer to memory now just extend the GByteArray
> to all the read register helpers. They can then safely append their
> data through the normal way. We don't bother with this abstraction for
> write registers as we have already ensured the buffer being copied
> from is the correct size.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> v4
>   - fix mem_buf calculation for ppc_maybe_bswap_register
> v5
>   - introduce gdb_get_reg_ptr and use for ppc
> ---

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

--
Damien
