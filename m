Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp564875ejs;
        Wed, 16 Aug 2023 11:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjHJDxGghqTWC/eblmOnDhzwDhqkfxt4+yITJ1Pex2/JAPxWNYHvUAxeYmFBlV8+37x03K
X-Received: by 2002:ac8:7e8d:0:b0:410:684:c3cf with SMTP id w13-20020ac87e8d000000b004100684c3cfmr3675630qtj.11.1692211955114;
        Wed, 16 Aug 2023 11:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692211955; cv=none;
        d=google.com; s=arc-20160816;
        b=Ifl838d+vGDbFPzjZd6P9+1jD+ioPswAlI/QrMprqLgqMHaNAgI9FJ8xqAjGY0R2F6
         c9Ju05ddtZ1mDDbVx/xgkENOQ8/AEcYIEfl0cJdoS2gJDPDyLJ7FKXPj3o8CsxURLUkz
         KWjGOyqqFudW4e7vMvqKwsdpFQfXGDvRgEBlgkc+7U+prg2goBaXOVe+AArtfB1n+82u
         Fg9sq/EPJb6Z28BKbm4y2zP5VMLuViOuMZGJcXku9sDpU6mKmRF11sNEjHVwtRQVb/OA
         +PgI6B37vRO8/P/nPNSYAzSRHe9XQNX46xuG+zifCGo6WCYpmBybC4bjVm+GMZIGZWvT
         GFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xrkOIGx36+6M03XBz/kT6anAx7sGJYq+LHXwDDeSvyw=;
        fh=yd5b/hRGoJ7I5GEKLKPiJXTbjvRB4auBmI+aVbW9N4E=;
        b=ZaZyLrOIUx9MuiyOVubyCwWKByZpXSqknGXpl+Lcq7YNmqrNhQmPlLDci3kOb6QF9K
         F76Tsf75f22JpOK4bmSqSRgepnbnpSDuvpiPY8nCezHg2wojoAJPoGobGD8H14l7x3H1
         PFlrte9mahpkTY9Izmimxxp5wVrAaNQWlkn35sg5GBrOMT3RTMur/mK6sPQ6S8pb36Pg
         U6oQLDTR5pwNn4ucPyVqIaxzLFKWPgck8vpiIvujXLXvs2rk/Y82WQeTv1l92JwgQNq0
         1i0bS2CqsaA+h42E7YsA7fxxqVUoNGpyQoOzElnupsKUMLFNRmq3XU5LOJdfyYUWuRHr
         fWFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="E2/nhYfH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020ac87d8f000000b00403b9664cf9si9139520qtd.494.2023.08.16.11.52.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Aug 2023 11:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="E2/nhYfH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qWLcp-00059j-6o; Wed, 16 Aug 2023 14:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qWLco-00059B-3T
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 14:52:10 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qWLcl-00041h-BL
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 14:52:09 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a7d4030621so3776530b6e.3
 for <qemu-arm@nongnu.org>; Wed, 16 Aug 2023 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692211925; x=1692816725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xrkOIGx36+6M03XBz/kT6anAx7sGJYq+LHXwDDeSvyw=;
 b=E2/nhYfHtw80sQgfoFywTF8d7zHqrrvpCOb7wldUj1/kZj494/YqIraPM0+lH6Cy1m
 aLAC50+9N40sfVedT+qbU4AQsT2XOF7FQWAg2sEnoU33p/su5Hxhx9mcNSOIgqv9Oglz
 qdFlvJJkiMiDCXkyYqxCPHucB/hfygdnJZKEawuEYMU925XjieBRU/BKfVxWQhgwGPAs
 gbOtuMU0A3WBCEU/3iKPcO4Zd3VDxiBqawzB0WV+2pVo/5JndWhIZzV7inPKUrfaoInc
 /PGqF70UlJ91Y+0uYN0z4E3MalsAfJ8FauMSxKf8yAsdcJDqjQWMc37pL2YRP/krOrab
 jJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692211925; x=1692816725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xrkOIGx36+6M03XBz/kT6anAx7sGJYq+LHXwDDeSvyw=;
 b=CUwUg3DbPxRyrnVgVI7Y+5BRyUcGGQykqIU5+Un3U1+sXkvKPMhcOsl3TqKPZV7o5f
 awCy0xHcodzRsSLD2blAtdi4Z2+qxSdOmK7KNJJIij1/Wyz2J9+taOLW/Ys2SypjaByV
 FUcP/2WIenhYSojswkOAyL1tgf3Gj4sT3ERDVtCmPLvWuohCie6ZOdV5Jr5JWT/f2z9l
 Lm2d9ZpuvshgS9rSkWp2qok6VVqK0sU/9Vcp2U6qKPc+TVDxf5rUG0bMjlRiSJc34zB5
 ap5i6bGVxfd7wckxJYbQ2JMdhkzBY5+xGLKjY84Udz8A7VfH0q9YEnB4bti8MXXKRiBN
 pmvA==
X-Gm-Message-State: AOJu0Yya4afkjs7198QvUQkFhEYt2qMS7TqMhTY4QfXl/tvR3p0w2h9m
 pkpt6SoFq+qgGLgyP832GIgVvQ==
X-Received: by 2002:a05:6808:6395:b0:3a7:48d2:fc82 with SMTP id
 ec21-20020a056808639500b003a748d2fc82mr2612708oib.38.1692211925182; 
 Wed, 16 Aug 2023 11:52:05 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 o26-20020a05680803da00b003a7847cf407sm6725822oie.44.2023.08.16.11.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 11:52:04 -0700 (PDT)
Message-ID: <badc96bf-821e-d769-ac40-39600f543e86@ventanamicro.com>
Date: Wed, 16 Aug 2023 15:51:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/10] hw/arm/virt-acpi-build.c: Move fw_cfg and virtio to
 common location
To: Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-2-sunilvl@ventanamicro.com>
 <20230724171859.212fec62@imammedo.users.ipa.redhat.com>
 <ZL/9XO47yEnaNzyN@sunil-laptop>
 <20230726102546.1cad6113@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230726102546.1cad6113@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.165,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B9KWrwgYfoGQ

DQoNCk9uIDcvMjYvMjMgMDU6MjUsIElnb3IgTWFtbWVkb3Ygd3JvdGU6DQo+IE9uIFR1ZSwg
MjUgSnVsIDIwMjMgMjI6MjA6MzYgKzA1MzANCj4gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOg0KPiANCj4+IE9uIE1vbiwgSnVsIDI0LCAyMDIzIGF0IDA1
OjE4OjU5UE0gKzAyMDAsIElnb3IgTWFtbWVkb3Ygd3JvdGU6DQo+Pj4gT24gV2VkLCAxMiBK
dWwgMjAyMyAyMjowOTozNCArMDUzMA0KPj4+IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5h
bWljcm8uY29tPiB3cm90ZToNCj4+PiAgICANCj4+Pj4gVGhlIGZ1bmN0aW9ucyB3aGljaCBh
ZGQgZndfY2ZnIGFuZCB2aXJ0aW8gdG8gRFNEVCBhcmUgc2FtZSBmb3IgQVJNDQo+Pj4+IGFu
ZCBSSVNDLVYuIFNvLCBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIGluIFJJU0MtViwgbW92ZSB0
aGVtIGZyb20NCj4+Pj4gaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jIHRvIGNvbW1vbiBhbWwt
YnVpbGQuYy4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZs
QHZlbnRhbmFtaWNyby5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgIGh3L2FjcGkvYW1sLWJ1aWxk
LmMgICAgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4+PiAgIGh3L2FybS92aXJ0LWFjcGktYnVpbGQuYyAgICB8IDQyIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4gICBody9yaXNjdi92aXJ0LWFjcGktYnVp
bGQuYyAgfCAxNiAtLS0tLS0tLS0tLS0tLQ0KPj4+PiAgIGluY2x1ZGUvaHcvYWNwaS9hbWwt
YnVpbGQuaCB8ICA2ICsrKysrKw0KPj4+PiAgIDQgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0
aW9ucygrKSwgNTggZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9ody9h
Y3BpL2FtbC1idWlsZC5jIGIvaHcvYWNwaS9hbWwtYnVpbGQuYw0KPj4+DQo+Pj4gcGF0Y2gg
bG9va3MgZmluZSBtb2R1bG8sDQo+Pj4gSSdkIHB1dCB0aGVzZSBpbnRvIHJlc3BlY3RpdmUg
ZGV2aWNlIGZpbGVzIGluc3RlYWQgb2YgZ2VuZXJpYw0KPj4+IGFtbC1idWlsZC5jIHdoaWNo
IHdhcyBpbnRlbmRlZCBmb3IgYmFzaWMgQU1MIHByaW1pdGl2ZXMNCj4+PiAoaXQgJ3MgZ290
IHBvbGx1dGVkIG92ZXIgdGltZSB3aXRoIGRldmljZSBzcGVjaWZpYyBmdW5jdGlvbnMNCj4+
PiBidXQgdGhhdCdzIG5vdCB0aGUgcmVhc29uIHRvIGNvbnRpbnVlIGRvaW5nIHRoYXQpLg0K
Pj4+DQo+Pj4gQWxzbyBoYXZpbmcgdGhvc2UgZnVuY3Rpb25zIGFsb25nIHdpdGggZGV2aWNl
cyBtb2RlbHMNCj4+PiBnb2VzIGFsb25nIHdpdGggc2VsZiBlbnVtZXJhdGluZyBBQ1BJIGRl
dmljZXMgKGN1cnJlbnRseQ0KPj4+IGl0IHdvcmtzIGZvciB4ODYgUENJL0lTQSBkZXZpY2Ug
YnV0IHRoZXJlIGlzIG5vIHJlYXNvbg0KPj4+IHRoYXQgaXQgY2FuJ3Qgd29yayB3aXRoIG90
aGVyIHR5cGVzIGFzIHdlbGwgd2hlbg0KPj4+IEkgZ2V0IHRoZXJlKQ0KPj4+ICAgIA0KPj4g
VGhhbmtzISwgSWdvci4gTGV0IG1lIGFkZCB0aGVtIHRvIGRldmljZSBzcGVjaWZpYyBmaWxl
cyBhcyBwZXIgeW91cg0KPj4gcmVjb21tZW5kYXRpb24uDQo+IGp1c3QgYmUgY2FyZWZ1bCBh
bmQgYnVpbGQgdGVzdCBvdGhlciB0YXJnZXRzICh3aGlsZSBkaXNhYmxpbmcgdGhlIHJlc3Qp
DQo+IGF0IGxlYXN0IG5vIHRvIHJlZ3Jlc3MgdGhlbSBkdWUgdG8gYnVpbGQgZGVwcy4gKEkn
ZCBwaWNrIDIgd2l0aCBBQ1BJDQo+IHN1cHBvcnQgdGhhdCB1c2UgYW5kIG5vdCB1c2VzIGFm
ZmVjdGVkIGNvZGUpIGFuZCAxIHRoYXQgIHVzZXMgZGV2aWNlDQo+IG1vZGVsIGJ1dCBkb2Vz
bid0IHVzZSBBQ1BJIGF0IGFsbCAoaWYgc3VjaCBleGlzdHMpDQoNClN1bmlsIGlzIGFscmVh
ZHkgYXdhcmUgb2YgaXQgYnV0IEknbGwgYWxzbyBtZW50aW9uIGhlcmUgc2luY2UgaXQgc2Vl
bXMgcmVsZXZhbnQNCnRvIElnb3IncyBwb2ludC4NCg0KDQpUaGlzIHBhdGNoIGJyZWFrcyBp
Mzg2LXNvZnRtbXUgYnVpbGQ6DQoNCg0KRkFJTEVEOiBsaWJxZW11LWkzODYtc29mdG1tdS5m
YS5wL2h3X2kzODZfYWNwaS1taWNyb3ZtLmMubw0KY2MgLW02NCAtbWN4MTYgLUlsaWJxZW11
LWkzODYtc29mdG1tdS5mYS5wIC1JLiAtSS4uIC1JdGFyZ2V0L2kzODYgLUkuLi90YXJnZXQv
aTM4NiAtSXFhcGkgLUl0cmFjZSAtSXVpIC1JdWkvc2hhZGVyIC1JL3Vzci9pbmNsdWRlL3Bp
eG1hbi0xIC1JL3Vzci9pbmNsdWRlL2dsaWItMi4wIC1JL3Vzci9saWI2NC9nbGliLTIuMC9p
bmNsdWRlIC1JL3Vzci9pbmNsdWRlL3N5c3Byb2YtNCAtZmRpYWdub3N0aWNzLWNvbG9yPWF1
dG8gLVdhbGwgLVdpbnZhbGlkLXBjaCAtV2Vycm9yIC1zdGQ9Z251MTEgLU8yIC1nIC1mc3Rh
Y2stcHJvdGVjdG9yLXN0cm9uZyAtVV9GT1JUSUZZX1NPVVJDRSAtRF9GT1JUSUZZX1NPVVJD
RT0yIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVzIC1Xc3Ry
aWN0LXByb3RvdHlwZXMgLVdyZWR1bmRhbnQtZGVjbHMgLVdvbGQtc3R5bGUtZGVjbGFyYXRp
b24gLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtV3R5cGUtbGltaXRzIC1XZm9ybWF0LXNlY3Vy
aXR5IC1XZm9ybWF0LXkyayAtV2luaXQtc2VsZiAtV2lnbm9yZWQtcXVhbGlmaWVycyAtV2Vt
cHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJucyAtV2VuZGlmLWxhYmVscyAtV2V4cGFuc2lvbi10
by1kZWZpbmVkIC1XaW1wbGljaXQtZmFsbHRocm91Z2g9MiAtV21pc3NpbmctZm9ybWF0LWF0
dHJpYnV0ZSAtV25vLW1pc3NpbmctaW5jbHVkZS1kaXJzIC1Xbm8tc2hpZnQtbmVnYXRpdmUt
dmFsdWUgLVduby1wc2FiaSAtaXN5c3RlbSAvaG9tZS9kYW5pZWxoYi93b3JrL3FlbXUvbGlu
dXgtaGVhZGVycyAtaXN5c3RlbSBsaW51eC1oZWFkZXJzIC1pcXVvdGUgLiAtaXF1b3RlIC9o
b21lL2RhbmllbGhiL3dvcmsvcWVtdSAtaXF1b3RlIC9ob21lL2RhbmllbGhiL3dvcmsvcWVt
dS9pbmNsdWRlIC1pcXVvdGUgL2hvbWUvZGFuaWVsaGIvd29yay9xZW11L2hvc3QvaW5jbHVk
ZS94ODZfNjQgLWlxdW90ZSAvaG9tZS9kYW5pZWxoYi93b3JrL3FlbXUvaG9zdC9pbmNsdWRl
L2dlbmVyaWMgLWlxdW90ZSAvaG9tZS9kYW5pZWxoYi93b3JrL3FlbXUvdGNnL2kzODYgLXB0
aHJlYWQgLURfR05VX1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0xBUkdFRklM
RV9TT1VSQ0UgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLWZ3cmFwdiAtZlBJ
RSAtaXN5c3RlbS4uL2xpbnV4LWhlYWRlcnMgLWlzeXN0ZW1saW51eC1oZWFkZXJzIC1ETkVF
RF9DUFVfSCAnLURDT05GSUdfVEFSR0VUPSJpMzg2LXNvZnRtbXUtY29uZmlnLXRhcmdldC5o
IicgJy1EQ09ORklHX0RFVklDRVM9ImkzODYtc29mdG1tdS1jb25maWctZGV2aWNlcy5oIicg
LU1EIC1NUSBsaWJxZW11LWkzODYtc29mdG1tdS5mYS5wL2h3X2kzODZfYWNwaS1taWNyb3Zt
LmMubyAtTUYgbGlicWVtdS1pMzg2LXNvZnRtbXUuZmEucC9od19pMzg2X2FjcGktbWljcm92
bS5jLm8uZCAtbyBsaWJxZW11LWkzODYtc29mdG1tdS5mYS5wL2h3X2kzODZfYWNwaS1taWNy
b3ZtLmMubyAtYyAuLi9ody9pMzg2L2FjcGktbWljcm92bS5jDQouLi9ody9pMzg2L2FjcGkt
bWljcm92bS5jOjQ4OjEzOiBlcnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKAmGFjcGlf
ZHNkdF9hZGRfdmlydGlv4oCZOyBoYXZlIOKAmHZvaWQoQW1sICosIE1pY3Jvdm1NYWNoaW5l
U3RhdGUgKinigJkNCiAgICA0OCB8IHN0YXRpYyB2b2lkIGFjcGlfZHNkdF9hZGRfdmlydGlv
KEFtbCAqc2NvcGUsDQogICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL2RhbmllbGhiL3dvcmsvcWVtdS9pbmNs
dWRlL2h3L2FjcGkvYWNwaV9hbWxfaW50ZXJmYWNlLmg6NSwNCiAgICAgICAgICAgICAgICAg
IGZyb20gLi4vaHcvaTM4Ni9hY3BpLW1pY3Jvdm0uYzoyOToNCi9ob21lL2RhbmllbGhiL3dv
cmsvcWVtdS9pbmNsdWRlL2h3L2FjcGkvYW1sLWJ1aWxkLmg6NTAzOjY6IG5vdGU6IHByZXZp
b3VzIGRlY2xhcmF0aW9uIG9mIOKAmGFjcGlfZHNkdF9hZGRfdmlydGlv4oCZIHdpdGggdHlw
ZSDigJh2b2lkKEFtbCAqLCBjb25zdCBNZW1NYXBFbnRyeSAqLCB1aW50MzJfdCwgIGludCni
gJkge2FrYSDigJh2b2lkKEFtbCAqLCBjb25zdCBNZW1NYXBFbnRyeSAqLCB1bnNpZ25lZCBp
bnQsICBpbnQp4oCZfQ0KICAgNTAzIHwgdm9pZCBhY3BpX2RzZHRfYWRkX3ZpcnRpbyhBbWwg
KnNjb3BlLCBjb25zdCBNZW1NYXBFbnRyeSAqdmlydGlvX21taW9fbWVtbWFwLA0KICAgICAg
IHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fg0KWzUvNzE0XSBDb21waWxpbmcgQyBvYmpl
Y3QgbGlicWVtdS1pMzg2LXNvZnRtbXUuZmEucC9od19pMzg2X2t2bV9jbG9jay5jLm8NCg0K
VGhpcyBoYXBwZW5zIGJlY2F1c2UgdGhlIGNvbW1vbiAnYWNwaV9kc2R0X2FkZF92aXJ0aW8n
IGZ1bmN0aW9uIG1hdGNoZXMgYSBsb2NhbA0KZnVuY3Rpb24gd2l0aCB0aGUgc2FtZSBuYW1l
IGluIGh3L2kzODYvYWNwaS1taWNyb3ZtLmMuIFdlIHdvdWxkIG5lZWQgdG8gZWl0aGVyDQpy
ZW5hbWUgdGhlIHNoYXJlZCBoZWxwZXIgb3IgcmVuYW1lIHRoZSBsb2NhbCBhY3BpLW1pY3Jv
dm0gZnVuY3Rpb24gb3IgZG8gc29tZXRoaW5nDQpsaWtlIElnb3IgbWVudGlvbmVkIHRvIGF2
b2lkIHRoaXMgbmFtZSBjb2xsaXNpb24uDQoNCg0KVGhhbmtzLA0KDQpEYW5pZWwNCg0KDQoN
Cg0KDQoNCg0KDQo+IA0KPj4NCj4+IFRoYW5rcyENCj4+IFN1bmlsDQo+Pg0KPiANCg==
