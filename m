Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2751120wrq;
        Thu, 24 Oct 2019 11:54:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxFXeoUMQjTLMXSc2VD9VbxTJT15fJKWgfDWUxTJrEyUFak0KSw1zWq6Qqle2IgvFdCEHmE
X-Received: by 2002:a05:6402:304c:: with SMTP id bu12mr28288192edb.230.1571943282261;
        Thu, 24 Oct 2019 11:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571943282; cv=none;
        d=google.com; s=arc-20160816;
        b=WoxsIoLYM+EbDhrfGxMkB/YeOjoJO24ZERDKQCudW8B5L5Z1dvVsRAnYC83jc5t7sa
         NOc2kcdvTomeMyReWf0lhkQ8hip61PxAMVgz9Uo6aYFsZ3WGjKvQZ8LXSCwze7YQiADl
         tSbarRiJlmD9jLbPFERwoEmafySNtNVVdg1bgaZqHkdj05Go2xOjFeHjti2KlqbDMw6d
         PbSVaoe0Q5LOHPtZG7ASBrB2xXx96FzxImQSSrXvSdXfyWJ5SWhu7oqgQbAWxhQqjMhh
         LzZ3PwEZix2QZPeRgAmCxGtP/FQqZyDe+nP3HLvNVdcIgXMRqfz77J0PgnTzTfIxMwCR
         y8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=jynmMqpKNeKV3JzTsUW9BhidE9cMOiYp+FOxh2lHLeY=;
        b=OMET0oMRUlVZj+ON4eD20NcaV/QeFq0YxVXI4hnHuMRsjNczBy7/BpF5XhRDVc0i1m
         /4fLJBFS0jGayan19vNhG0c41nA5rf0/a6saEwm1ISx3LffvMgbvWST3zjr7OSWlO0vI
         isUn+x54EhgL3i2R7v9utBpneXBLRraYA5OCeCa8NWAaf7pWFVPl7i8SlksiacJCPpZU
         356AseVTX9O96BV6bpa1sUGWwkmjzD/AAI4Qvl3ksXIO09kScrNwNfeXaoN3QEF98q2t
         rSlMZI7AX+7Nmo53Un0kzJVVMPc3Y9e7YBjJHEVJBLAXP/QV8Pa4F99QEIxsQpUxZ03A
         yLTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L1GdIyiy;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id cb5si9774803ejb.270.2019.10.24.11.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 11:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L1GdIyiy;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571943281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=jynmMqpKNeKV3JzTsUW9BhidE9cMOiYp+FOxh2lHLeY=;
	b=L1GdIyiy2DpIhfpNy9fb3Ls0T/8qg6MFleU861vyLGkYCdgO53NmlbMpdn6L63fZRwX/72
	/vGcVLDiP00IIsGqqYsZxhGn/L1wYqXfTyehOzBL40yzpk7pSbLzyT8Z2w9q83BZvLQWz0
	LjqUY7JpG8lp6PU+VoXj18GYH7iMJG8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-iqbsVB4tO7uMyUn9xZZy4A-1; Thu, 24 Oct 2019 14:54:37 -0400
Received: by mail-wr1-f69.google.com with SMTP id 67so13270730wrm.18
        for <alex.bennee@linaro.org>; Thu, 24 Oct 2019 11:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6yJjsMKTKIQ8186Ut9F69hXzw2UPrl7hcIMPBBbZhCY=;
        b=HdEq9PiTfrBlu+Q+qLNxESMMLRpo8RKVPLnNcVK+4wnZe8dRa9/6wHOJ5Md3tejN38
         4VArifATW1iOrdqyB9wXFeY19F+4q7LGIvkj70yKLF71rXDon9BL/TSj/zqWe3V7Ni+x
         0DlNpPibmxzBOey/vris3SgB70SeqAbgz2ABrGV4gfcxt8lFIKosSP/o97iTli89WTX2
         uHEk11SM9jHcksqMpuC/WdRBfuaad1MtlrH3GMDBqutcpPQiXc2UOfYYrWe8FvHIAZID
         5syXENcxnSjz1imxvm2Emnk478YfdyM2YftGsbzGqvpGo0QPepxld8IWjrkJPxADm+fy
         C5aA==
X-Gm-Message-State: APjAAAWMfckFH+E9OvenyWDZ1VSAHuIkQO0L+Q7BxOfrS30+TzxXxKiv
	SubXgDTz1/yQrQNnoRTIUhrkTQyYELTEihDQRhe0S3KmUHARy+0A9NOEjmtF/zWdSxZc/YYEyCl
	ZPNVoCCS7S0tXkOjk
X-Received: by 2002:a05:600c:2383:: with SMTP id m3mr4011044wma.176.1571943276052;
        Thu, 24 Oct 2019 11:54:36 -0700 (PDT)
X-Received: by 2002:a05:600c:2383:: with SMTP id m3mr4011020wma.176.1571943275670;
        Thu, 24 Oct 2019 11:54:35 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:302c:998e:a769:c583? ([2001:b07:6468:f312:302c:998e:a769:c583])
        by smtp.gmail.com with ESMTPSA id d11sm29279675wrf.80.2019.10.24.11.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 11:54:35 -0700 (PDT)
Subject: Re: [PATCH] Semihost SYS_READC implementation (v3)
To: qemu-devel@nongnu.org, keithp@keithp.com
Cc: peter.maydell@linaro.org, riku.voipio@iki.fi, laurent@vivier.eu,
 qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <157193841432.8331.7323182040062540268@37313f22b938>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <89ada4b1-ee3d-a512-07c2-9bc1ba5806da@redhat.com>
Date: Thu, 24 Oct 2019 20:54:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <157193841432.8331.7323182040062540268@37313f22b938>
Content-Language: en-US
X-MC-Unique: iqbsVB4tO7uMyUn9xZZy4A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0xvo48v2V1F+

On 24/10/19 19:33, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20191023192640.13125-1-keithp@keith=
p.com/
>=20
>=20
>=20
> Hi,
>=20
> This series failed the docker-quick@centos7 build test. Please find the t=
esting commands and
> their output below. If you have Docker installed, you can probably reprod=
uce it
> locally.
>=20
> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> make docker-image-centos7 V=3D1 NETWORK=3D1
> time make docker-test-quick@centos7 SHOW_ENV=3D1 J=3D14 NETWORK=3D1
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>=20
>   CC      aarch64-softmmu/target/arm/translate-sve.o
> ../vl.o: In function `main':
> /tmp/qemu-test/src/vl.c:4385: undefined reference to `qemu_semihosting_co=
nsole_init'
> collect2: error: ld returned 1 exit status
> make[1]: *** [qemu-system-x86_64] Error 1
> make: *** [x86_64-softmmu/all] Error 2
> make: *** Waiting for unfinished jobs....
>   LINK    aarch64-softmmu/qemu-system-aarch64
> Traceback (most recent call last):
> ---
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['sudo', '-n', 'docker', 'run', '=
--label', 'com.qemu.instance.uuid=3D3c82d370996f429bb4be7fef56e7247b', '-u'=
, '1001', '--security-opt', 'seccomp=3Dunconfined', '--rm', '-e', 'TARGET_L=
IST=3D', '-e', 'EXTRA_CONFIGURE_OPTS=3D', '-e', 'V=3D', '-e', 'J=3D14', '-e=
', 'DEBUG=3D', '-e', 'SHOW_ENV=3D1', '-e', 'CCACHE_DIR=3D/var/tmp/ccache', =
'-v', '/home/patchew/.cache/qemu-docker-ccache:/var/tmp/ccache:z', '-v', '/=
var/tmp/patchew-tester-tmp-nju6kwxi/src/docker-src.2019-10-24-13.29.33.2420=
5:/var/tmp/qemu:z,ro', 'qemu:centos7', '/var/tmp/qemu/run', 'test-quick']' =
returned non-zero exit status 2.
> filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3D3c82d370996f429bb4be=
7fef56e7247b
> make[1]: *** [docker-run] Error 1
> make[1]: Leaving directory `/var/tmp/patchew-tester-tmp-nju6kwxi/src'
> make: *** [docker-run-test-quick@centos7] Error 2

Looks like you need to add a dummy implementation of the new function to
stubs/semihost.c, for use in targets that don't support semihosting.

Thanks,

Paolo
