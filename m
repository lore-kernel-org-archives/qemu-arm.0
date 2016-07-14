Bcc: qemu-ppc@nongnu.org
Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f187sm3030711wmf.15.2016.07.14.05.04.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 05:04:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 947793E03EF;
	Thu, 14 Jul 2016 13:04:25 +0100 (BST)
References: <1468354426-837-1-git-send-email-sergey.fedorov@linaro.org> <1468354426-837-7-git-send-email-sergey.fedorov@linaro.org> <87y4544iv1.fsf@linaro.org> <57877310.4070205@gmail.com> <79a897b0-107d-f647-943b-dc5247cac999@redhat.com>
User-agent: mu4e 0.9.17; emacs 25.0.95.9
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, Sergey Fedorov <sergey.fedorov@linaro.org>, 
	qemu-devel@nongnu.org, mttcg@greensocs.com, fred.konrad@greensocs.com, 
	a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com, 
	rth@twiddle.net, patches@linaro.org, mark.burton@greensocs.com, 
	jan.kiszka@siemens.com, peter.maydell@linaro.org, claudio.fontana@huawei.com, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>, 
	Leon Alrae <leon.alrae@imgtec.com>, Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>, 
	Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-pp <c@nongnu.org>
Subject: Re: [PATCH v3 06/11] tcg: Introduce tb_mark_invalid() and tb_is_invalid()
In-reply-to: <79a897b0-107d-f647-943b-dc5247cac999@redhat.com>
Date: Thu, 14 Jul 2016 13:04:25 +0100
Message-ID: <87twfs4e9i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 46z5393tcHcc


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 14/07/2016 13:10, Sergey Fedorov wrote:
>> > This has merge conflicts with the current state of master. Is there
>> > anyway to have a common implementation that is specialised only when
>> > needed?
>>
>> The point was to put the assumptions on invalid CPU TB state as close to
>> cpu_get_tb_cpu_state() definitions as possible. So that if anyone make
>> changes they can notice those assumptions and correct them if necessary.
>
> It causes some repetition indeed, but I think it's a good idea.
>
> restore_state_to_opc is another case where most implementations have the
> same simple "env->pc = data[0]" implementation.

Yeah, now I've seen cpu_get_tb_cpu_state jump up the hot-path I tend to
agree ;-)

--
Alex Bennée
