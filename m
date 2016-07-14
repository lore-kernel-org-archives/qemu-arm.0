Received: by 10.25.21.156 with SMTP id 28csp41154lfv;
        Thu, 14 Jul 2016 04:48:48 -0700 (PDT)
X-Received: by 10.37.199.4 with SMTP id w4mr8632513ybe.67.1468496928364;
        Thu, 14 Jul 2016 04:48:48 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h13si761871ywa.7.2016.07.14.04.48.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 04:48:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 229C0C0023AC;
	Thu, 14 Jul 2016 11:48:46 +0000 (UTC)
Received: from [10.36.112.46] (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u6EBmYtW031214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 14 Jul 2016 07:48:36 -0400
Subject: Re: [PATCH v3 06/11] tcg: Introduce tb_mark_invalid() and
 tb_is_invalid()
To: Sergey Fedorov <serge.fdrv@gmail.com>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Sergey Fedorov <sergey.fedorov@linaro.org>
References: <1468354426-837-1-git-send-email-sergey.fedorov@linaro.org>
 <1468354426-837-7-git-send-email-sergey.fedorov@linaro.org>
 <87y4544iv1.fsf@linaro.org> <57877310.4070205@gmail.com>
Cc: qemu-devel@nongnu.org, mttcg@greensocs.com, fred.konrad@greensocs.com,
        a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
        rth@twiddle.net, patches@linaro.org, mark.burton@greensocs.com,
        jan.kiszka@siemens.com, peter.maydell@linaro.org,
        claudio.fontana@huawei.com,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Michael Walle <michael@walle.cc>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Leon Alrae <leon.alrae@imgtec.com>,
        Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alexander Graf <agraf@suse.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
        qemu-arm@nongnu.org, qemu-ppc@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <79a897b0-107d-f647-943b-dc5247cac999@redhat.com>
Date: Thu, 14 Jul 2016 13:48:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <57877310.4070205@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 14 Jul 2016 11:48:47 +0000 (UTC)
X-TUID: b25/hIrLHerF



On 14/07/2016 13:10, Sergey Fedorov wrote:
> > This has merge conflicts with the current state of master. Is there
> > anyway to have a common implementation that is specialised only when
> > needed?
>
> The point was to put the assumptions on invalid CPU TB state as close to
> cpu_get_tb_cpu_state() definitions as possible. So that if anyone make
> changes they can notice those assumptions and correct them if necessary.

It causes some repetition indeed, but I think it's a good idea.

restore_state_to_opc is another case where most implementations have the
same simple "env->pc = data[0]" implementation.

Paolo
