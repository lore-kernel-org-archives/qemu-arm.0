Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3612495lfk;
        Mon, 6 Dec 2021 11:40:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBPe1HOukcBC67OJCbFVcULlHXtep8+tJdi7IdQpf+Qqv2nPdoHlk9O0pkjnGAkUfwQyL7
X-Received: by 2002:a02:b813:: with SMTP id o19mr43039520jam.130.1638819657912;
        Mon, 06 Dec 2021 11:40:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638819657; cv=none;
        d=google.com; s=arc-20160816;
        b=V2oJu+uD02Hj5Tf0HLxflxI+4UPIV26YfjXED2OG27skNVok5w20FoAxnOxlS5DC7T
         0VSbOC0JxVdUSAmH8RtcWDGLvcdVBJroizYY0pLY6gtRIL/a4meHw2HF8w7iGVHcW7W6
         CSGlCwyugfhZTsdSIy/Sa1nFdrwGQIVfIxHPVz2/Krk9mbkPq+bPHBtCU/XhaoBfGvIn
         YEP0JT9GHvguJFzTskoKfspObksZyONTxtgGCn1CYIihAMegdmo0EBNrOkZQzoCDEapv
         vvDnaPQo0GQUBEEWp8f9lv9szPdeMQtgjMwRKpzE/H9eKIhOfv1M5pJR5rk54dQggm/4
         cn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=dJsv45CTniK3UPELst2wThxtkHsEs78SkbqvaT8sDYI=;
        b=fsiNRTTATKevZeGYJDN8SEbgmzj/X7zIwmRmVnDRgvjC0LhH96Im1INY6H98yOc8Ud
         wrNbjCRlHEm3Efg5io6kflIOBGWruH5YNeP/A90MdTO36lww0or+pAu7nG9oUWLcE1iG
         /p3iLbiQMpKcu1I8VLCIvkz8/HAy2ibWFCNon2dd1krTUOG3D5m31aEOj6j+bTg0+CtD
         wfwq7hTA1qH/F86FvKwiTtvmKprd7clqAG+bdPZjHkYBmxkWMsWFBjvAfweD5V9zJbfE
         wZR5WjkqmMm9qKH9L5LhdHbJhMZ7Tpe3A9yNA+eZChlRUv+Mdhb+PnI/HB7SPthlTrpk
         IMiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vasilev.oleg@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=vasilev.oleg@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <vasilev.oleg@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com. [45.249.212.187])
        by mx.google.com with ESMTPS id z12si14684465ilb.16.2021.12.06.11.40.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Dec 2021 11:40:57 -0800 (PST)
Received-SPF: pass (google.com: domain of vasilev.oleg@huawei.com designates 45.249.212.187 as permitted sender) client-ip=45.249.212.187;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vasilev.oleg@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=vasilev.oleg@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J7DKp1CltzcbnC;
	Tue,  7 Dec 2021 03:40:14 +0800 (CST)
Received: from dggpemm500012.china.huawei.com (7.185.36.89) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 03:40:25 +0800
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggpemm500012.china.huawei.com (7.185.36.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 03:40:24 +0800
Received: from dggpeml500023.china.huawei.com ([7.185.36.114]) by
 dggpeml500023.china.huawei.com ([7.185.36.114]) with mapi id 15.01.2308.020;
 Tue, 7 Dec 2021 03:40:24 +0800
From: Vasilev Oleg <vasilev.oleg@huawei.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Konobeev Vladimir
	<konobeev.vladimir@huawei.com>, Plotnik Nikolay <plotnik.nikolay@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, Andrey Shinkevich <andrey.shinkevich@huawei.com>,
	"Emilio G. Cota" <cota@braap.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "Chengen (William, FixNet)" <chengen@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Suggestions for TCG performance improvements
Thread-Topic: Suggestions for TCG performance improvements
Thread-Index: AQHX52GV5RpBCy0TxkCBqrK5dfMw1Q==
Date: Mon, 6 Dec 2021 19:40:24 +0000
Message-ID: <35631f7cceb141879aa7475ccaf81acb@huawei.com>
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
 <87bl1zxaeu.fsf@linaro.org> <7d137a2403be43b7a1c5857e96866403@huawei.com>
 <87v905wq6d.fsf@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.47.169.108]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: WIltuHAT25KK

On 12/3/2021 8:32 PM, Alex Benn=E9e wrote:=0A=
> Vasilev Oleg <vasilev.oleg@huawei.com> writes:=0A=
>=0A=
>> On 12/2/2021 7:02 PM, Alex Benn=E9e wrote:=0A=
>>=0A=
>>> Vasilev Oleg <vasilev.oleg@huawei.com> writes:=0A=
...skipped...=0A=
>>> I did ponder a debug mode which would keep the last N tables dropped by=
=0A=
>>> tlb_mmu_resize_locked and then measure the differences in the entries=
=0A=
>>> before submitting the free to an rcu tasks.=0A=
>>>> The mentioned paper[4] also describes other possible improvements.=0A=
>>>> Some of those are already implemented (such as victim TLB and dynamic=
=0A=
>>>> size for TLB), but others are not (e.g. TLB lookup uninlining and=0A=
>>>> set-associative TLB layer). Do you think those improvements=0A=
>>>> worth trying?=0A=
>>> Anything is worth trying but you would need hard numbers. Also its all=
=0A=
>>> too easy to target micro benchmarks which might not show much differenc=
e=0A=
>>> in real world use. =0A=
>> The  mentioned paper presents some benchmarking, e. g. linux kernel=0A=
>> compilation and some other stuff. Do you think those shouldn't be=0A=
>> trusted?=0A=
> No they are good. To be honest it's the context switches that get you.=0A=
> Look at "info jit" between a normal distro and a initramfs shell. Places=
=0A=
> where the kernel is switching between multiple maps means a churn of TLB=
=0A=
> data.=0A=
>=0A=
> See my other post with a match of "msr ttrb"=0A=
Sorry, couldn't find what you are referring to. Could you, please, share=0A=
a link?=0A=
>>>> Another idea for decreasing occurence of TLB refills is to make TBs ke=
y=0A=
>>>> in htable independent of physical address. I assume it is only needed=
=0A=
>>>> to distinguish different processes where VAs can be the same.=0A=
>>>> Is that assumption correct?=0A=
>> This one, what do you think? Can we replace physical address as part=0A=
>> of a key in TB htable with some sort of address space identifier?=0A=
> Hmm maybe - so a change in ASID wouldn't need a total flush?=0A=
=0A=
No, I think it would need a flush since regular memory accesses need to=0A=
be in the correct address space. But, we won't need to access TLB when=0A=
looking for the next TB. Also, TLB wouldn't need to be filled with code=0A=
pages, only data pages.=0A=
=0A=
Overall, thanks for your feedback on those ideas.=0A=
=0A=
Oleg=0A=
=0A=
=0A=
...skipped...=0A=
=0A=
=0A=
