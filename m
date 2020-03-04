Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp1660098lfi;
        Wed, 4 Mar 2020 06:12:57 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtC0FvPYHo07rPuwEO1arQCPeZXa8VlEtnUGT6Wav2r2u/7oLWHeBE8ivjxRetGPw4ceYT1
X-Received: by 2002:a05:620a:2114:: with SMTP id l20mr3077810qkl.214.1583331176922;
        Wed, 04 Mar 2020 06:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583331176; cv=none;
        d=google.com; s=arc-20160816;
        b=BqVycdkt7CIaZyxNnrPgzAqY9czvcXTWyAWL5WEI4kIzMJ/yeCBNSZAvNqEbN6iPWy
         XeW3tP8CzpLEreNPHSuryf96eL0WCQlEwe94EANn4Or5WTnnVfk70ry9a7UDOB3N0gaq
         J3KDGcLebPsKxlkz1fDHsNE+xvH11dS3O8XR1luFzQj6FCnRdHdKTQFL94YGdvUF1DCI
         VxxxtqNJNgvc5ZPisg+5p0O6iUzcRYxaMZn5X58Q9cJTKco0iZ9Lt2ICxaEmUntQocb3
         dee49cYF9LEYdC32v/xLrhX9F8AcBJnr/CwHiN2Vr7F6t+iKCMoHIPvknMZoONS2ywzU
         Bcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=b7srj8zEuTazIYxOYrJokLlRxWd2VZAqD00tlhx9owY=;
        b=Mbn84Y4Syht8rsD/dZkjuAQjKCkHhEt+4clV+zvXIHQvca2w9V5r1JXYAOKvJwSs86
         AxRqXHRpgHn9kqqybZMz51LhXptbdw3Ywud/QNZEJI6arkZeeInpiHAKvmxkF7myBGdj
         skSRikmPy5kPJGquHJh8Sj0b5AOFjPlcSLpOOpUhxvcf9bff2lxUxBtkuiZFmpJkH/Dy
         Bk6hK+Xqqb6Oi/A4TLobhtKkxnIP7pyNkTTRJfFZCWfUVM73d7JNrdwOAVCV8h79/fVJ
         qXLdl/MFErc8sK0ngh/54Gm5p2pjGDgrIyeONkicJqGuT/itEBfZ4s0Rrv9dZua9Dg6e
         pe1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gW3NIvyJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si900710qkl.292.2020.03.04.06.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 06:12:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gW3NIvyJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9Ulc-0005wf-Dg
	for alex.bennee@linaro.org; Wed, 04 Mar 2020 09:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9UlR-0005vA-Qb
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 09:12:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9UlQ-0006Se-2M
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 09:12:44 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48729
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9UlP-0006Qv-R5
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 09:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583331163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7srj8zEuTazIYxOYrJokLlRxWd2VZAqD00tlhx9owY=;
 b=gW3NIvyJksP4Aii5w40XR0hW92fAOtknF9BbulaGpR3V/godshe5+49xFr6J9hwrFK8AL6
 J1PPXua262/JNMqeEvGR/uiFU8i9PrSoCH0BBka3FB531UA0fO1e/QrhmWIzRiwvwR9jt+
 lcAAGWFORVs2zrtBL+nv98JtVxhyB6c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-tzu_m5IIOn2pq0gHfW7jEQ-1; Wed, 04 Mar 2020 09:12:41 -0500
X-MC-Unique: tzu_m5IIOn2pq0gHfW7jEQ-1
Received: by mail-ed1-f69.google.com with SMTP id s21so1715995edy.3
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2020 06:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lFyl0oWSIFawg9jU+3cT2APwSI/olxPL8/tc2lKxfMo=;
 b=fdq03kZ7PN6eK+GBDMdypBLJZbWnqOxW4kgTPdWBhURoyDJ2q+06fCuaWvBsc3hKRn
 00K9ktB/Kg1JbmzRPKTOTV4FzZagN1pF95aPstNYS0U2dDHxizkHX592vxGjxZTps4qF
 FSQww7trruvtW+LHUAz/bKRD1jw5vkKQzP5BYEFYXfhll+PV/TIGp+IeChd/JxLb1gwC
 tJ+rDm6TdhOOsuUWKK0oAodZO/uMua48lsEHZRgP/t9NQNSa+p4fMFjrsfyGoexF37Jj
 mBoKUMJ4BAlRshYQKwTKisSuhLhO86Zl5lguBXvmgZnZDXNq3FC1S1xJj+xQ3nOg4iQH
 3CQA==
X-Gm-Message-State: ANhLgQ09Dm4NYHI+kbL+DIJoKHmlb0QW0GJeeMcm24exU1a7x1YH0hgn
 jGLzI7/sCoU2ymyvQzKyULvDFPpk1EvNWqBvlG8NH7ytEZmofBeIorjJ5BlrRk6F7ia0qDYLHq3
 IliuxuE7roLMD
X-Received: by 2002:aa7:d98b:: with SMTP id u11mr3006948eds.318.1583331160132; 
 Wed, 04 Mar 2020 06:12:40 -0800 (PST)
X-Received: by 2002:aa7:d98b:: with SMTP id u11mr3006903eds.318.1583331159941; 
 Wed, 04 Mar 2020 06:12:39 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id h21sm1070908ejq.83.2020.03.04.06.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 06:12:39 -0800 (PST)
Subject: Re: [PATCH 1/2] misc: Replace zero-length arrays with flexible array
 member (automatic)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200304005105.27454-1-philmd@redhat.com>
 <20200304005105.27454-2-philmd@redhat.com>
 <1e1a1491-15ca-29d4-8bd6-1bf14edb4ad5@redhat.com>
 <38b55649-b1cd-8891-5c13-ec4c6ef3ae5e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f1d4241c-e82e-53db-cc33-898890a0b070@redhat.com>
Date: Wed, 4 Mar 2020 15:12:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <38b55649-b1cd-8891-5c13-ec4c6ef3ae5e@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eyRSkTRwfjwa

On 3/4/20 2:44 PM, Paolo Bonzini wrote:
> On 04/03/20 14:12, Philippe Mathieu-Daud=C3=A9 wrote:
>>
>> hw/scsi/spapr_vscsi.c:69:29: error: field 'iu' with variable sized type
>> 'union viosrp_iu' not at the end of a struct or class is a GNU extension
>> [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>  =C2=A0=C2=A0=C2=A0 union viosrp_iu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 iu;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^
>>
>> Yay we found a bug! Thanks Gustavo :)
>>
>> union srp_iu {
>>  =C2=A0=C2=A0=C2=A0 struct srp_login_req login_req;
>>  =C2=A0=C2=A0=C2=A0 struct srp_login_rsp login_rsp;
>>  =C2=A0=C2=A0=C2=A0 struct srp_login_rej login_rej;
>>  =C2=A0=C2=A0=C2=A0 struct srp_i_logout i_logout;
>>  =C2=A0=C2=A0=C2=A0 struct srp_t_logout t_logout;
>>  =C2=A0=C2=A0=C2=A0 struct srp_tsk_mgmt tsk_mgmt;
>>  =C2=A0=C2=A0=C2=A0 struct srp_cmd cmd;
>>  =C2=A0=C2=A0=C2=A0 struct srp_rsp rsp;
>>  =C2=A0=C2=A0=C2=A0 uint8_t reserved[SRP_MAX_IU_LEN];
>> };
>=20
> It's variable-sized but it's okay as long as the total size doesn't
> exceed SRP_MAX_IU_LEN.  So it's not a bug, but I agree it's a time bomb.
>   Moving the field last should work, but it would still be quite
> dangerous code.

Yeah I reached the same conclusion.

I'll send a fix for the dangerous code.
Do you want to drop this series, or only the change in 'struct srp_rsp'=20
(or in all hw/scsi/srp.h). Actually I guess it makes sense I move the=20
'hw/scsi/srp.h' changes with the series cleaning dangerous code.

