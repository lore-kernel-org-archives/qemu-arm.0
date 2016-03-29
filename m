Received: by 10.25.208.211 with SMTP id h202csp2022794lfg;
        Tue, 29 Mar 2016 05:52:38 -0700 (PDT)
X-Received: by 10.55.78.84 with SMTP id c81mr2394524qkb.85.1459255958315;
        Tue, 29 Mar 2016 05:52:38 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b93si25482597qgf.85.2016.03.29.05.52.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2016 05:52:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1akt8P-0006CT-UK
	for alex.bennee@linaro.org; Tue, 29 Mar 2016 08:52:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1akt6b-0003cv-92
	for qemu-devel@nongnu.org; Tue, 29 Mar 2016 08:50:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1akt6Z-0003tz-RS
	for qemu-devel@nongnu.org; Tue, 29 Mar 2016 08:50:45 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:33032)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1akt6F-0003pg-Vk; Tue, 29 Mar 2016 08:50:24 -0400
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <56FA79F9.60606@mail.uni-paderborn.de>
Date: Tue, 29 Mar 2016 14:50:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.3.0.2556906, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2016.3.29.124216
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, proljc@gmail.com,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	petar.jovanovic@imgtec.com, blauwirbel@gmail.com,
	jcmvbkbc@gmail.com, miodrag.dinic@imgtec.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	edgar.iglesias@gmail.com, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com, afaerber@suse.de,
	aurelien@aurel32.net, rth@twiddle.net
Subject: Re: [Qemu-devel] [PATCH 1/2] softfloat: Enable
 run-time-configurable meaning of signaling NaN bit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pCppXga9LK4e

On 03/25/2016 01:50 PM, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> 
> This patch enables SoftFloat library to be configured at run-time in
> relation to the meaning of signaling NaN bit.
> 
> Background:
> 
> In floating-point calculations, there is a need for denoting undefined or
> unrepresentable values. This is achieved by defining certain floating-point
> numerical values to be NaNs (which stands for "not a number"). For additional
> reasons, virtually all modern floating-point unit implementations use two
> kinds of NaNs: quiet and signaling. The binary representations of these two
> kinds of NaNs, as a rule, differ only in one bit (it is traditionally,
> the first bit of mantissa).
> 
> Up to 2008, standards for floating-point did not specify all details about
> binary representation of NaNs. More specifically, the meaning of the bit
> that is used for distinguishing between signaling and quiet NaNs was not
> strictly prescribed. (IEEE 754-2008 was the first floating-point standard
> that defined that meaning clearly, see [1], p. 35) As a result, different
> platforms took different approaches, and this presented certain challenge
> in emulators like QEMU.
> 
> Mips architecture represent the most complex case among QEMU-supported
> architectures regarding signaling NaN bit. Up to Release 6 of Mips
> architecture, "1" in signaling NaN bit denoted signaling NaN, which is
> opposite to IEEE 754-2008 standard. From Release 6 on, Mips architecture
> adopted IEEE standard prescription, and "0" denotes signaling NaN. On top of
> that, Mips architecture for SIMD (also known as MSA, or vector instructions)
> also specifies signaling bit in accordance to IEEE standard. MSA unit can be
> implemented with both pre-Release 6 and Release 6 main processor units.
> 
> QEMU uses SoftFloat library to implement various floating-point-related
> instructions on all platforms. The current implementation allows for defining
> meaning of signaling NaN bit during build time, and is implemented via
> preprocessor macro called SNAN_BIT_IS_ONE.
> 
> The change in this patch enables SoftFloat library to be configured in
> run-time. This configuration is meant to occur during CPU initialization,
> when it is definitely known what desired behavior for particular CPU
> (or any additional FPUs) is.
> 
> The change is implemented so that it is consistent with existing
> implementation of similar cases. This means that structure float_status is
> used for passing the information about desired signaling NaN bit during each
> invocation of SoftFloat functions. The additional field in float_status is
> called snan_bit_is_one, which supersedes macro SNAN_BIT_IS_ONE.
> 
> Further break down of changes:
> 
>   (for the sake of brevity, a placeholder XXX is used below and it might
>   mean float16, float32, float64, floatx80, or float128)
> 
>   1) Added field snan_bit_is_one to the structure float_status,
>      and the correspondent setter function set_snan_bit_is_one().
> 
>   2) SoftFloat library constants XXX_default_nan converted to functions
>      XXX_default_nan(float_status*). This is necessary since they are
>      dependant on signaling bit meaning.
> 
>   3) Added a float_status* argument to SoftFloat library functions
>      XXX_is_quiet_nan(XXX a_), XXX_is_signaling_nan(XXX a_),
>      XXX_maybe_silence_nan(XXX a_).
> 
>   4) Updated code in all architectures to reflect changes in SoftFloat
>      library. This change is twofolds: it includes modification of SoftFloat
>      library functions invocations, and addition of invocations of function
>      set_snan_bit_is_one() during CPU initialization, with arguments that
>      are appropriate for each architecture.
> 
> IMPORTANT:
> 
> This change is not meant to create any change in emulator behavior or
> functionality on any platform. It just provides the means for SoftFloat
> library to be used in a more flexible way - in other words, it will just
> prepare SoftFloat library for usage related to Mips platform and its
> specifics regarding signaling bit meaning, which is done in the next patch.
> 
> [1] "IEEE Standard for Floating-Point Arithmetic",
>     IEEE Computer Society, August 29, 2008.
>     (http://www.csee.umbc.edu/~tsimo1/CMSC455/IEEE-754-2008.pdf)
> 
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> ---
>  fpu/softfloat-specialize.h    | 546 +++++++++++++++++++++---------------------
>  fpu/softfloat.c               | 170 +++++++------
>  include/fpu/softfloat.h       |  49 ++--
>  target-alpha/cpu.c            |   2 +
>  target-arm/cpu.c              |   2 +
>  target-arm/helper-a64.c       |  14 +-
>  target-arm/helper.c           |  40 ++--
>  target-i386/cpu.c             |   4 +
>  target-m68k/cpu.c             |   2 +
>  target-m68k/helper.c          |   6 +-
>  target-microblaze/cpu.c       |   2 +
>  target-microblaze/op_helper.c |   6 +-
>  target-mips/helper.h          |   4 +-
>  target-mips/msa_helper.c      |  96 ++++----
>  target-mips/op_helper.c       |  13 +-
>  target-mips/translate.c       |   4 +-
>  target-mips/translate_init.c  |   6 +-
>  target-openrisc/cpu.c         |   2 +
>  target-ppc/fpu_helper.c       | 120 +++++-----
>  target-ppc/translate_init.c   |   2 +
>  target-s390x/cpu.c            |   1 +
>  target-s390x/fpu_helper.c     |  28 ++-
>  target-s390x/helper.h         |   6 +-
>  target-s390x/translate.c      |   6 +-
>  target-sh4/cpu.c              |   1 +
>  target-sparc/cpu.c            |   1 +
>  target-tricore/helper.c       |   1 +
>  target-unicore32/cpu.c        |   1 +
>  target-xtensa/cpu.c           |   3 +
>  29 files changed, 608 insertions(+), 530 deletions(-)
> 

For the TriCore part you can have a

Tested-by: Bastian Koppelmann<kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

