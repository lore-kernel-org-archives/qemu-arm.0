Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp872507njb;
        Wed, 8 Jan 2025 06:15:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGsIrBNaJFhhhlb8b6QJibVVlBUHMfrsIISzzil5fFv0U2+IVbZ1vTavTXMVjq6yyLfur7
X-Received: by 2002:a05:6602:7504:b0:844:cb6b:56b2 with SMTP id ca18e2360f4ac-84ce007c893mr289793639f.6.1736345711610;
        Wed, 08 Jan 2025 06:15:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736345711; cv=none;
        d=google.com; s=arc-20240605;
        b=GwDGBNOKLt+HUluYh/ELoYopHM8Az169cFPHtqLVdXnNvVLshb9mj+/5BblOld6OOt
         iiZmynCjPsTvR9R4zj42fnbiTKoMKf//wmc1OjVqguGaL+ZL4CrqjBfljnX7MYrXRUgu
         ompW6UT+Ls1/MzKpOsdMvYa38mZajo1qn+lQPahnLMAcz5zmQXJs784BMuO8L7maYjrG
         +ahv2fPaI6wv1TGca9jp8KvvW6B/rsszXggoBI0pt76sWv1aplmvqmStpH9486hluCZ2
         q73r0WGHjimtfKkl+IH5Dq4Xt7HMrQyVVv+k8khwa6wi4mhRxm0RslriqdCm6rHN0HCp
         MsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=6xKFvF+CTfc/Sx73gmcJGcAlmt1nugJqIuC/683n58I=;
        fh=etlUlT9YTuxLNCn9a37I+Y2rZfaCHvtJEafpa9OIIos=;
        b=IlkWq1CIoAQklJ3Wa4uTkuCeliYbCL0vVnKM0a+l5tmm29K13O4szohsLZ+rvL60ae
         pTnFFXeb0fLnDsUBaOmRT8elDHSO6irTv7o40JiSFjZ8qdfj4+VVOYfjtZRfR3T6fvM0
         fLB1IEKcNRaf0iWB+Pt691D+fr7wz2d56lN+dQkbhHV8xvIUIdLhlJNwQUpB0oBxmpRV
         hQD85uaZgS/0e+EsbqbaWacLomaY/rwTmBpJqe2rkW+yKiQjibw07t06MNpsAINFN0z+
         VRQR6hoDgeCSZSRU12YEddY0y5dHuGurGuqaS8h/xfAnaFQhrrKMs71xIRiJm8oUBS1I
         Xi2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="O/m1izuM";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ca18e2360f4ac-8498d8a7484si2099852539f.76.2025.01.08.06.15.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:15:11 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="O/m1izuM";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736345711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6xKFvF+CTfc/Sx73gmcJGcAlmt1nugJqIuC/683n58I=;
	b=O/m1izuM+FOkvtl7RKmu2tiKPu06BXkrKEi3cHel2sz6Gs80Ph8sxCrRLALw5acMKynIl0
	DcT0CqwZWPoMT9oWFN8W8ZWembaFitCpEn5nqsfdBhq4ZInCYMFfszMdkYYP8LydYeTV0u
	qE1j6s3jqcDBmVFqMZsJEC4w4VDmzjM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-tivXFnKNPAGkU6x_xvAxCQ-1; Wed, 08 Jan 2025 09:15:08 -0500
X-MC-Unique: tivXFnKNPAGkU6x_xvAxCQ-1
X-Mimecast-MFC-AGG-ID: tivXFnKNPAGkU6x_xvAxCQ
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8b3173b5bso263058746d6.3
        for <alex.bennee@linaro.org>; Wed, 08 Jan 2025 06:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345707; x=1736950507;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6xKFvF+CTfc/Sx73gmcJGcAlmt1nugJqIuC/683n58I=;
        b=mNxEtwT3zTthCAsH7PaSIz+3pz7WStNblGD6+WhJavzXoVYaKI+9arN9GZLLofq9Z1
         tkTcSRJpDgc9l6uq85RgTxiy+27PjhHZVLmbVNvKKubqRfZZPgNAujAgyjblpwaovxbc
         Ctj0fmDs9CAGTauO/SBbey3Htb5Mo1jxhz2ytkimlb3ww/9mwuvcoB5ZJCQ3/1JiXPwZ
         YvB02i+DQdEymWqkAmY7uR1+DoJ+GTaQF3XqTpAlWiwioHgNpqP1k/+bht0R8zoqQOdu
         /uxrLidUeEQhzQXOPiQ2GlX9xUyLgqQKwNiq4MoDVmiAotveK5jTeS8qDK9xXR3Y7D4V
         8riA==
X-Gm-Message-State: AOJu0YyMVOKgyKN/Fc22ezsdVaMfgNmt67axHIWVGjRdRxU9eYGe8gGI
	GKGLIdhSYhpB4AgVkTHBsCfGRWXoGDSbzKOAoniJoPbMWEuS8CVoZ97MBJfNUUloyvHH26Hrch/
	0GZOfOhhBkYoktxSO4tofS8M/LvbJEPasXs38RRN27WlcvzU3j2czOGvvm96M8s6kSWTk6s3Eq/
	vNXS9HNHguFG4y5OXYU7woWVblWiRJUMu4rw==
X-Gm-Gg: ASbGncvuiiBNnPUmjjyj11JSy8ECHHtYI0WlxAPojYNjeXGVFazQWk6wBVUUrMq/dGb
	SAIMp9jZxm9fHANJjtgl6zgbMZZBpfo/9dZZI26W7uo3DgxGycc9k7qPOvd6hEfHk0fCHezeoEa
	YsDVQOiBm7HNDbX5d9msfzNdjJKANwaVzv9eoxB6bZkBTBT2Gp7vU6R3fR9v/gd9SByU/Oq+3Kq
	lFgefvHaLYeeDf/AGtN9hQw1RmKHNehMdUAwa/6dZ3WbyTPjWFSzhgFfLzdSXLugDRk9FPDlJQz
	B3CTpA==
X-Received: by 2002:ad4:5967:0:b0:6d8:8aa6:ef27 with SMTP id 6a1803df08f44-6df9b2d7f31mr51264906d6.38.1736345707726;
        Wed, 08 Jan 2025 06:15:07 -0800 (PST)
X-Received: by 2002:ad4:5967:0:b0:6d8:8aa6:ef27 with SMTP id 6a1803df08f44-6df9b2d7f31mr51263836d6.38.1736345707164;
        Wed, 08 Jan 2025 06:15:07 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6a9cb6sm196062931cf.51.2025.01.08.06.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:15:06 -0800 (PST)
Message-ID: <e9ea11e0-8833-4f76-a13c-0616c286a6ec@redhat.com>
Date: Wed, 8 Jan 2025 15:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/32] tests/functional: remove unused
 kernel_command_line
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Laurent Vivier
 <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
 <20250108121054.1126164-22-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <20250108121054.1126164-22-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZfEsQhDdjG15o6lx_5kRi5-_JHr9SW_EFRsXKlAIJwc_1736345708
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lnmmv63t3Ozt

On 08/01/2025 13.10, Alex Bennée wrote:
> The Alpine test boots from the CDROM so we don't --append a command
> line. Drop the unused code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/test_aarch64_virt.py | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
> index 2d9995a95d..b3d3b0ee51 100755
> --- a/tests/functional/test_aarch64_virt.py
> +++ b/tests/functional/test_aarch64_virt.py
> @@ -41,8 +41,6 @@ def test_alpine_virt_tcg_gic_max(self):
>   
>           self.set_machine('virt')
>           self.vm.set_console()
> -        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> -                               'console=ttyAMA0')
>           self.require_accelerator("tcg")
>   
>           self.vm.add_args("-accel", "tcg")

Reviewed-by: Thomas Huth <thuth@redhat.com>
