Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1003022njg;
        Wed, 26 Feb 2025 08:03:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQRzG21navYpVU7apaqweLwSTLFf2dkxmmo4l+/ydMho6n/hqTY2Wmz4ns36WaeVj4o1M+
X-Received: by 2002:a2e:8197:0:b0:308:f92e:625d with SMTP id 38308e7fff4ca-30b79163261mr24900121fa.15.1740585828698;
        Wed, 26 Feb 2025 08:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740585828; cv=none;
        d=google.com; s=arc-20240605;
        b=flmhZqESI2zbYKuizgDV9tOGBh3RPcq7iF+BMUO1vvHmvJtiGoi7qv1h6CdsBRsp8w
         vYDUNy8q3RAMJglsvxOHexN3NRjEX6EnjA6tdRDA+5x1sRiD9arza6BSOaHtOY/ZKkPr
         j8xPv22T7kitaG3fzOd9Dd6fB8yG4ltmE/2clUeB/nCGzSET4ZQUO6dcDdIWyWDGAMDe
         na1W8HvUOid2QmwMPrwdj7vtbYlcb2etEdfGjawRWtKn1UakSGRlI90Hi8670f4p14xN
         nWJkx/nYHXKY+8puguQWMfYuanSdrdaPe20eQb+YSzVSPzMP+KgjkjeIlCktBjELmSQ/
         yUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Vys1crufxgV8URf90WVmjfVw0TwUnvqSFz1bm5BPLPw=;
        fh=kMuyKEDVLpXx+n9GsiCpA1spgm27ONyskfB4MRxywKY=;
        b=V1VdKiANXdsMWnDb589ZzouK1vMY8wV31Owui2S56Ytgi4l4aVjuh76r8rN6VLd6yB
         RwdIKgtVCf8/aIep+Rtn/nZJd4JEoPDGx1Zs5qPfxmCcUfiaIcWjW4w9hQFA/wYoLpbe
         ZAMhWeWCxGveiVGQgzEdp+cQ4AW2PFvRSuxDYjDPVnMPPwZ7uKR1bCYJV6BeYH1vSCf1
         OXQnB1NKbqnMU/YnozLjL4N+ndco3Pm8V0xNi3z17xC/45AiDhSkWrs6VGzBRu2yim89
         arShDJrAmcE4Nn0T9egZCphX+ArycNuiXWvskxY3Y3ZuwWhdl96FOEe52LQWmOqSBPdU
         VltA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMP7O8wd;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-30a81a80a1bsi39174561fa.492.2025.02.26.08.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:03:48 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMP7O8wd;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740585827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Vys1crufxgV8URf90WVmjfVw0TwUnvqSFz1bm5BPLPw=;
	b=FMP7O8wdf6de+EiCQ8vl9zVCOauwpAxW8E1+7Fhrci3Rgu8GdtZpHMCYMtQF7MmyJXiC8k
	wcObcfPejqdBs05iDpy5SL+Vh/3q1+jLTiHA+30klFFNOlS+C8QYweGg4DdcMSSnsUkeN0
	gu8Sh4hiewwusc06SDJhv/4vaUX0slk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-xpFRlvTKNo2cQCVsp9JT3g-1; Wed, 26 Feb 2025 11:03:43 -0500
X-MC-Unique: xpFRlvTKNo2cQCVsp9JT3g-1
X-Mimecast-MFC-AGG-ID: xpFRlvTKNo2cQCVsp9JT3g_1740585822
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-439858c5911so33256805e9.2
        for <alex.bennee@linaro.org>; Wed, 26 Feb 2025 08:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585822; x=1741190622;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vys1crufxgV8URf90WVmjfVw0TwUnvqSFz1bm5BPLPw=;
        b=HzI8hyo0EKC7LnSSErec+o6udyxVfJLPud/OhUm44YZ8UH2dB9v/BQH0r7YIgLC1pc
         A7HRI6cEcbPJSaptwck4eskYXkwVX1hB073GVA0nm7qO6C8ko01U5yIXYj1XEiRT/pVW
         tEQ4j4OIK+mlUwXaseEcGxVZ78BVIq43K7Ik+rkh38i+2LUF8sCl2CbjWu+XhVxWW2B+
         7riSxtMOTy0gWLok3+Cr5mfXA16hJ3S71psuZGZSGDEW+vgw7xMC/s9PdlA3DkZqUmkM
         sAsmXW8GtYq+OTJfkIZ0JjDctGube/irJSwolc60nxcN4HS64PWsGUpizSgrA3vUlBCe
         DLFQ==
X-Gm-Message-State: AOJu0YwdeOX8bcSRW7ncDql5j2YPKKDprATtCJrE9NN4oSFDmMkH1kzb
	LuD7+M+HVFAWoW9FWW61njlI67JN/F47rgc/f4AJ851ysZxnQLQKmPKnkk0yCsqMfS3E1RD7rnA
	8Rf7pIuBx9IStuQIJ+gNyb2oiLkA0/4kdLGHOScsPXqtgwtByPmMwobcz7wr0huzrsMJzXgkmSk
	2ICVOUmOPtV7wJyOkJV0mWO4s1lKmuO+SPZg==
X-Gm-Gg: ASbGncvzCSplislC7kh7zLYFfDOzmwULON5wMxLPzplwWbikTltEoTI0gRlSMnBl8uK
	QlVKB2BkuRK7Ygfkp5H+cWnLfxKivF3W5wxteualbCD0Oy1tUNzBYzgfKn/HAQCs39P6jspdu7T
	VzfjWAFUWPlFAmVO7eR59qO+vA93f3D4EF6CFd3WyyN/UW2WXP+EI5hjkpOokRkK6vr+3INUMcd
	lOt6fJ+V8AJ45DAoLMNzIx8FAlovcqFyvVVS5KaI6IVKpw6T8Ps0FaIkS7xU9BJe225ax0gFjM4
	XyfFyNKV+Q10uB9sx7qocGJQkHfbiAznL0Eq/rBcmNy4ZP0=
X-Received: by 2002:a05:600c:35c3:b0:439:8a8c:d3ca with SMTP id 5b1f17b1804b1-43ab903c452mr38624075e9.29.1740585822437;
        Wed, 26 Feb 2025 08:03:42 -0800 (PST)
X-Received: by 2002:a05:600c:35c3:b0:439:8a8c:d3ca with SMTP id 5b1f17b1804b1-43ab903c452mr38623105e9.29.1740585821875;
        Wed, 26 Feb 2025 08:03:41 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-245.web.vodafone.de. [109.42.49.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52b97bsm26608115e9.8.2025.02.26.08.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 08:03:41 -0800 (PST)
Message-ID: <e5339f5d-aaf5-4b90-a14f-b73e9af294bc@redhat.com>
Date: Wed, 26 Feb 2025 17:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/25] tests/functional: expand tests to cover virgl
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-5-alex.bennee@linaro.org>
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
In-Reply-To: <20250226140343.3907080-5-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U0_RdaW_2yY6YWRJYL9CMgA1o6qFtWe0EvnzaDMNVmI_1740585822
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HiJVPi6bD9qz

On 26/02/2025 15.03, Alex Bennée wrote:
> Add two more test modes using glmark2-wayland to exercise the OpenGL
> pass-through modes with virgl. Virgl can run with or without the
> hostmem blob support.
> 
> We might want to eventually add more directed tests and individual
> features later on but the glmark/vkmark tests are a good general
> smoke test for accelerated 3D.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20250219150009.1662688-5-alex.bennee@linaro.org>
> ---
>   tests/functional/test_aarch64_virt_gpu.py | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
> index c9463d7285..7a8471d1ca 100755
> --- a/tests/functional/test_aarch64_virt_gpu.py
> +++ b/tests/functional/test_aarch64_virt_gpu.py
> @@ -89,6 +89,26 @@ def _run_virt_gpu_test(self, gpu_device,  weston_cmd, weston_pattern):
>           full_cmd = f"weston -B headless --renderer gl --shell kiosk -- {weston_cmd}"
>           exec_command_and_wait_for_pattern(self, full_cmd, weston_pattern)
>   
> +    @skipIfMissingCommands('zstd')
> +    def test_aarch64_virt_with_virgl_gpu(self):
> +
> +        self.require_device('virtio-gpu-gl-pci')
> +
> +        gpu_device = "virtio-gpu-gl-pci"
> +        weston_cmd = "glmark2-wayland -b:duration=1.0"
> +        weston_pattern = "glmark2 Score"
> +        self._run_virt_gpu_test(gpu_device, weston_cmd, weston_pattern)
> +
> +    @skipIfMissingCommands('zstd')
> +    def test_aarch64_virt_with_virgl_blobs_gpu(self):
> +
> +        self.require_device('virtio-gpu-gl-pci')
> +
> +        gpu_device = "virtio-gpu-gl-pci,hostmem=4G,blob=on"
> +        weston_cmd = "glmark2-wayland -b:duration=1.0"
> +        weston_pattern = "glmark2 Score"
> +        self._run_virt_gpu_test(gpu_device, weston_cmd, weston_pattern)
> +
>       @skipIfMissingCommands('zstd')
>       def test_aarch64_virt_with_vulkan_gpu(self):
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>
