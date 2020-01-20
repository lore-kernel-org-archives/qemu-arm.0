Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp558816lfp;
        Mon, 20 Jan 2020 11:03:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyflrt/gfG977p4T+9kYdfKyc2gZvx8vN8UBIHb+KoD56LMu5SKwu+dsNHPhNXr13XSgUT
X-Received: by 2002:ac8:408c:: with SMTP id p12mr821935qtl.336.1579547000302;
        Mon, 20 Jan 2020 11:03:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579547000; cv=none;
        d=google.com; s=arc-20160816;
        b=zNmcevZCnhpSRJVqviPmU4v+g7ncf1lv3c6FlPUkkkCs3ZAEOGOtPHvLueR79AnZ2U
         8lG8uwwDGEXTcKiivK+8TJQtoSiV4XuRelyXpklwEZW2Xrcxl/frYlQVlXpBL10NaN2u
         O18AkwXTEx6FE45fq3wQDnNGmlBJFTQChqh2toaR+KppHv2Cdb4NrMn2Bdlk64FZ9OB4
         k4egor+pdyaRO+ERZ40mcM2tKHnjK7Ap8+pmuaG+mrfSrBZvZcQTZYUWPWZqxrdDG58m
         rKSVihKxbZ9VyQCez1xt2ZZ8J5pR1/tDbGcE8tfxKHerm/4ygp6a61dU89JTTwc3M7Pp
         j/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EhCNMjX983nC8F7qVvCJbWLa8D2WM/aCqt/wvcrqF5c=;
        b=rEu316KD7udY3ZQa4IULfj3zqfzdbvnq6ltNI/spI6B/9QwlclPQpy3HbZOyqJLPiH
         hQ9mEUt+sTY4J/Ftw3IH6Hgv/aBjX9qIsgfwdMd8zsVAKoje3QKMeOUU3L3ykOb1PET6
         9bn2+8mCUHFN2vtBz+AK+9k04wi1l0wOiLNqd+sltEUrZ9Th3uoRyodFN4ey3ToyK5C/
         GC+C7KM3N1xecDOeZhzk+jOHoAc3KrFq7tC1xuUQz5BDpYSN6F6e644E7ldrKfeKTGyE
         y3o8w7MX9Rt7KCsAkfydARMAqacuWAk+0P84CuAX7LexS/d3glgbCTLuATe+S8MmNLYU
         CjFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PxhGjDlh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si21360810qvv.218.2020.01.20.11.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 11:03:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PxhGjDlh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itcKU-0000zA-Vl
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 14:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itcJY-0000Ll-CD
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 14:02:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itcJS-0006iR-UU
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 14:02:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60156
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itcJS-0006iD-QA
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 14:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579546934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhCNMjX983nC8F7qVvCJbWLa8D2WM/aCqt/wvcrqF5c=;
 b=PxhGjDlhtapvcfZ1aw8X8GXk29gR1iKRiMSHCo+wELCQzamZEkmmPulU5+cRWhJg7FO5tL
 jcAVCMAGd6kS4WOHENetrj5BzYL9Ic92J1plGUBWYx2cWf0PO2H+PoJVkZplBIxDVdBf47
 Tw0YBnCW5QAJyxFnnxqv6CbpL3g2b1Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-M8JOR6v-OrmpSgZUpP2WOA-1; Mon, 20 Jan 2020 14:02:13 -0500
Received: by mail-wm1-f69.google.com with SMTP id s25so30304wmj.3
 for <qemu-arm@nongnu.org>; Mon, 20 Jan 2020 11:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EJI/jxaTJNO4GsVuiSQITtTXsjQkBuso2rOaws0BmPk=;
 b=Xd8NH884BplMqWEg7RIBtAOW8jWXFzgTAHj8NwvCmmXiyRUwxp9oLl+ABzizL+1VDc
 5i7Z1GxSJpY2+aJoKfXOIfeoMWs2eEQz5DS7wCYqJgFtlETSNXa6obBSd2LbqdooXFkC
 hWigFgzHVPFyqtG3IA6MU/00psyXuohqsdGodVwejFENysp+rL3+ofckIYaLj8psNwvD
 uN/HKmLmY77PbYEtqNICoeuIjJS4sJgZdFlAigYOrt/vy/4e/54041KuXV8kK3GAdkin
 IJrBywL3ISFPMHofY+zezv0ykZxcolnlj+rIDQQtYk9dvbhm3DFi6skS1BtsvQ1p6ZMU
 7DqQ==
X-Gm-Message-State: APjAAAXoS+A9Uv8HUnhmDc+4Ws2z9gje6WqLz6Es7aVVkwYyR3O53/rf
 7N0gYjlYK4taBdriOVwN7CtR9IRY2zXf0RNaD9b8MQgXO1/1E6JZK2HrBy5Wz1OElNAqeyBD6B8
 1TmMO+yN/IMeJ
X-Received: by 2002:a5d:448c:: with SMTP id j12mr886400wrq.125.1579546931841; 
 Mon, 20 Jan 2020 11:02:11 -0800 (PST)
X-Received: by 2002:a5d:448c:: with SMTP id j12mr886366wrq.125.1579546931571; 
 Mon, 20 Jan 2020 11:02:11 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id s128sm391543wme.39.2020.01.20.11.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 11:02:10 -0800 (PST)
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
References: <20191217173252.4672-1-philmd@redhat.com>
 <84fthiaahd.wl-Peter.Chubb@data61.csiro.au>
 <87a77q9njk.fsf@dusky.pond.sub.org>
 <97c34bbd-79d2-070e-a35e-4fdf68b2e291@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <db49a831-df35-c209-5db5-0631a5ef2497@redhat.com>
Date: Mon, 20 Jan 2020 20:02:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <97c34bbd-79d2-070e-a35e-4fdf68b2e291@redhat.com>
Content-Language: en-US
X-MC-Unique: M8JOR6v-OrmpSgZUpP2WOA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
 Hannes Reinecke <hare@suse.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yoDUxhy3fXAT

Hi Paolo,

On 1/18/20 8:24 PM, Paolo Bonzini wrote:
> On 18/12/19 07:05, Markus Armbruster wrote:
>> "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
>> writes:
>>
>>>>>>>> "Philippe" =3D=3D Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =
writes:
>>>
>>> Philippe> Fix some trivial warnings when building with -O3.
>>>
>>> For compatibility with lint and other older checkers, it'd be good to k=
eep
>>> this as /* FALLTHROUGH */ (which gcc should accept according to its
>>> manual).
>>
>> We have hundreds of /* fall through */ comments already.
>>
>>> Fixing the comments' placement is a different matter, and should be
>>> done.  Seems to me that until gcc started warning for this, noone had
>>> actually run a checker, and the comments were just for human info.
>>>
>>> Peter C
>>
>=20
> Queued, thanks.

Thanks, but I sent a v2 (20191218192526.13845-1-philmd@redhat.com) with:

- addressed Thomas and Aleksandar comments
- dropped 'hw/scsi/megasas: Silent GCC9 duplicated-cond warning'
- dropped 'qemu-io-cmds: Silent GCC9 format-overflow warning'

See:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg666280.html

Can you queue it instead?

