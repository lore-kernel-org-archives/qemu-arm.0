Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9017760wrv;
        Fri, 9 Aug 2019 03:33:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyvLbAC/zzE+XLheE2vFSEMobVluj2FkcPkOP5EfSc79jPgqA3kfPXLJpEepRtqlcBV7Yd6
X-Received: by 2002:a17:906:418:: with SMTP id d24mr18061147eja.258.1565346808353;
        Fri, 09 Aug 2019 03:33:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565346808; cv=none;
        d=google.com; s=arc-20160816;
        b=vY4P+ffVtXqn8YtamsvfBtWi6+DTSAjU8Db/Fxf9uPeD3Cngs/TWyzA7p0kgS5Lxsk
         jjexVYLkXdld1rEXelvVuZIV/Ervi8/m++BWIkmp8voowjM2PCvWHCjzFO/7LzPBlzLp
         Vhdcb9CAgHtUyu26EwHBfyi1UJAl67NkSruu/itlZYSGqjIyzdezc71wYHY/c7WyIsqG
         h83q8OdTrVLSfzELbzX43K0t8cHelL9qABXc9fLLaLwZA9EnKc8z7EeaDBWlmRYxKaMA
         3Nzi4JsRweupEoc2xxG6b8sYUPrqvfkTsCBf8TcPvVUc8TQCzNlDGDLTGeHjFzi/dqWM
         Ylyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iHVoPg+8BuMUDlRpKhiGjRvydQMjhoEPdvVwBi/uiOQ=;
        b=y/DuKygU1wPzLZFYRnlN1sJqrRirsJ7TCuO3OmoK+LKNp2kSxbkNcNDlz0zoqZIL4P
         KiDyiyYjQw4dSqn34P/StX4sjGE5lRpTpGIKJ4h2urMb35lPFwxlrE0NpCnnLVlVzyH3
         /notPdG7dEz+kwkT11yHa4c31rMnCZsugFvcnYYvZh/hpbnDtEPWwrI8p1IRlw6qwRX7
         JTDNe9/0CmLa/k8uiq1k/lWYaFjaTFND6z/9EXsxefulueyXQrWxBrk0kxN98AlWjNjk
         /vqVdg5RxDiKxHfIkuAJ+WNKY5nHhQLodZdTigV2FQj2K+Z1hQ4OogenpI+SjftdeHzH
         GV3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QLv7g4ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si31228917ejo.117.2019.08.09.03.33.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 03:33:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QLv7g4ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw2D9-0006bi-Ej
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 06:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59304)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hw2Cl-0006Lm-SI
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 06:33:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hw2Ck-00053J-Pq
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 06:33:03 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42508)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hw2Ck-00052Z-Ku
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 06:33:02 -0400
Received: by mail-ot1-x344.google.com with SMTP id l15so130767216otn.9
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2019 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iHVoPg+8BuMUDlRpKhiGjRvydQMjhoEPdvVwBi/uiOQ=;
 b=QLv7g4ng3lh5Qnv5En7uENfWjgwQA8fKIhZfE7YIk4MrGSJ8fbPy+0SogZ71vUvRzD
 QfUTB3Lv03aTFnQwjGISq8gw0AA1QXQ9tfl1qtPIa3G8MX5Vt/5ApEbWa+rwYBycFWdU
 Bp4fpfUiFXWfDw880ZGbWctruf0vDHu9F7NTUpNKOff+nlNtOD9cMPgZkZm9Yyt0rEAD
 rIQBQpnDyiKDc6oEYB1pn64bqfcK2t67/GS180/UNZefgt/G5hACwOjVhekv56Xmli0l
 9HKTybXNq0t1DMPx+ZjZC9fLUrjl5shlLps6NhvI1KwyXVKqyWjCRP63pKPdWkOPmkeX
 9j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHVoPg+8BuMUDlRpKhiGjRvydQMjhoEPdvVwBi/uiOQ=;
 b=IKAGSZTsGS+ix0dY8nxn5WszszmNalTIGUd6qrZaOjMqxtydg8V7E6U25fc6UNdHzB
 pLItSQVeUbSG/29ooUWyJ/BLMEZFFzfWlneIoQSKBwB3hEU9n84zLkAddYmodmBwSi7V
 LY7U7/RBMd9LOOH/Py1cu9jMTFDe1iAxg0Bg1q01ITrq3wLOrLW14HL1ydZgvj58gOxB
 QczcDrTH5SdacQMbYGxtH+F6hDJaW5G2UDINyd214sUxD6SvkL6PRl0bYaytOL+Vd4yI
 ySeRWByHK8PpwfH+mSh42lvIVjqDzqVn7mfjDtkOrsy/da03BcZXgFeE+KLQ7ls+XCP2
 yUVA==
X-Gm-Message-State: APjAAAW77pKk7MdTW5eB39giAbszdY/+oLp/dirUNeXrL+zdKgf5AviS
 DworQyCYPrnKzzFSjcNcuoZyG2bwZMobjJyZKuX6hA==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr17853726oti.91.1565346781848; 
 Fri, 09 Aug 2019 03:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-8-damien.hedde@greensocs.com>
 <CAFEAcA-W0SaaGbUnGZ0b61ngxKY8R9xjwGXeN+=MaUi4bMDgNg@mail.gmail.com>
 <20190808154219.GK2852@work-vm>
 <CAFEAcA8L2YVMCu3Gb+eQTDfCpgVwA_WwVPrqPLV2iQ9rZ4HuTA@mail.gmail.com>
 <f400248f-7a3b-83e9-3355-77de359e3f43@greensocs.com>
In-Reply-To: <f400248f-7a3b-83e9-3355-77de359e3f43@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Aug 2019 11:32:51 +0100
Message-ID: <CAFEAcA-YjLA25wPBgWOB_c2fV2o7C8n=1-uUVe6xgiP=j5+Fgw@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v3 07/33] automatically add vmstate for reset
 support in devices
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BUCoACTKDHQk

On Fri, 9 Aug 2019 at 11:29, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> One way to keep the feature without copy-pasting vmsd would be to add
> a new vmstate_register with an additional argument to pass the base
> class vmsd section and handle the whole thing there.

If we have a vmstate section which contains no actual data,
only subsections with 'needed' functions, is it migration
compatible with previous versions in the same way that
tacking a subsection onto an existing function is?

thanks
-- PMM
